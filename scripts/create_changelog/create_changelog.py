#!/usr/bin/env python3

import os

from os import listdir
from os.path import isfile, join

# Capitalize only first letter of a string while not changing anything else
def capitalize_first_letter(s):
    if not s:
        return s
    return s[0].upper() + s[1:]

# Fetch commits since last tag
last_tag_cmd = 'git describe --tags `git rev-list --tags --max-count=1`'
last_tag = os.popen(last_tag_cmd).read().strip('\n')

commit_messages_cmd= f'git --no-pager log --pretty=format:"%s" {last_tag}..HEAD --no-merges'
commit_messages = os.popen(commit_messages_cmd).read().split('\n')

# Set ignored words
ignored_words = {'readme', 'linting', ' lint', 'fastlane', ' test ', 'tests', '.yaml', '.vscode', 'flutter', 'gradle', 'dependencies', 'compileSdkVersion', 'targetSdkVersion', 'kotlin_version', 'docs', 'chore', 'refactor'}

# Feature list
features = []

# Fix list
fixes = []

# Localization lists
localizations_added = []
localizations_updated = []

# Discard or add to list or summarize
for commit_message in commit_messages:
    # Discard commits with ignored words
    if any( x in commit_message.lower() for x in ignored_words):
        continue

    # Fixes
    if ('fix' in commit_message.lower()):
        changed_message = commit_message.replace('Fix: ', '').replace('Fix ', '')
        changed_message = commit_message.replace('fix: ', '').replace('Fix ', '')
        fixes.append(capitalize_first_letter(changed_message))
        continue

    # Localizations
    added_notice = 'Added translation using Weblate ('
    if (added_notice in commit_message):
        localizations_added.append(commit_message.replace(added_notice, '').replace(')', ''))
        continue

    updated_notice = 'Translated using Weblate ('
    if (updated_notice in commit_message):
        localizations_updated.append(commit_message.replace(updated_notice, '').replace(')', ''))
        continue
    if ('translation' in commit_message.lower() and 'update' in commit_message.lower()):
        localizations_updated.append(commit_message)
        continue

    # Improvements: Everything else...
    if ('feat' in commit_message.lower()):
        commit_message = commit_message.replace('Feat: ', '').replace('Feat ', '')
        commit_message = commit_message.replace('feat: ', '').replace('feat ', '')

    features.append(capitalize_first_letter(commit_message))
    continue

absolute_dir = os.path.dirname(__file__)
relative_changelogs_dir = '../../fastlane/metadata/android/en/changelogs'
absolute_changelogs_dir = f'{absolute_dir}/{relative_changelogs_dir}'

changelog_files = [f for f in listdir(absolute_changelogs_dir) if isfile(join(absolute_changelogs_dir, f))]
last_changelog = changelog_files[-1]
last_changelog_nr = last_changelog.split('.')[0]

# Check pubspec.yaml
pubspec_path = f'{absolute_dir}/../../pubspec.yaml'
pubspec_file = open(pubspec_path)
pubspec_content = pubspec_file.readlines()
version_identifier = 'version: '
current_version = ''

for line in pubspec_content:
    if line.startswith(version_identifier):
        current_version = line.replace(version_identifier, '')
        break

current_version_build = current_version.split('+')[1]
suggested_next_build = str((int(current_version_build) + 1))

if (int(suggested_next_build) <= int(last_changelog_nr)):
    raise Exception('ERROR! There is a changelog for the next build number or greater')

new_changelog_file_path = f'{absolute_changelogs_dir}/{suggested_next_build}.txt'
new_changelog_file = open(new_changelog_file_path, 'a')

for feature in features:
    new_changelog_file.write(f'- [feat] {feature}\n')

for fix in fixes:
    new_changelog_file.write(f'- [fix] {fix}\n')

# Added translations
if (len(localizations_added) != 0):
    localizations_added.sort()

    new_changelog_file.write('- [l10n] Added ')

    for locale in localizations_added:
        new_changelog_file.write(f'{locale}')
        if locale != localizations_added[-1]:
            new_changelog_file.write(', ')
    new_changelog_file.write('\n')

# Updated translations
if (len(localizations_updated) != 0):
    # Remove double entries
    localizations_updated = list(dict.fromkeys(localizations_updated))

    for updated in localizations_updated:
        if (updated in localizations_added):
            # Remove as updated if language was just added
            localizations_updated.remove(updated)

    localizations_updated.sort()


    new_changelog_file.write('- [l10n] Updated ')

    for locale in localizations_updated:
        new_changelog_file.write(f'{locale}')
        if locale != localizations_updated[-1]:
            new_changelog_file.write(', ')

print('Consider using https://www.conventionalcommits.org')
print(f'Wrote new changelog to {new_changelog_file_path}')