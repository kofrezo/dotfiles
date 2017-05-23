import os
import vim


def main():
    current_line = vim.current.line
    cursor_column = int(vim.eval('col(".")'))

    # Nothing to autocomplete here
    if not current_line:
        return vim.command('return -1')

    manifest_file = vim.current.buffer.name
    module_directory = manifest_file[:manifest_file.find('manifests')]
    module_name = module_directory[:-1].split('/').pop()

    puppet_classes = []
    manifest_files = get_manifest_files(module_directory + 'manifests')
    for manifest_file in manifest_files:
        puppet_class = get_puppet_class(module_name, manifest_file)
        puppet_classes.append(puppet_class)

    matching = filter_matching(puppet_classes, current_line, cursor_column)

    return vim.command('return {}'.format(matching))


def get_manifest_files(directory):
    """Get all manifests files for directory -> list"""

    manifest_files = []

    for dir_info in os.walk(directory):
        for directory in dir_info[1]:
            mfs = get_manifest_files('{}/{}'.format(dir_info[0], directory))
            manifest_files.extend(mfs)

        for filename in dir_info[2]:
            if filename.endswith('.pp'):
                manifest_files.append('{}/{}'.format(dir_info[0], filename))

    return manifest_files


def get_puppet_class(module_name, manifest_file):
    """Get puppet classname for manifest file -> str"""

    parts = manifest_file.split('/')
    index = parts.index('manifests')

    return '{}::{}'.format(module_name, '::'.join(parts[index + 1:])[:-3])


def filter_matching(puppet_classes, current_line, cursor_column):
    """Filter for things that actually match -> list

    This is the actual workhorse which takes the available puppet_classes as
    list, current line and cursor position and filters out the matches.

    Arguments:
        puppet_classes -- list e.g. ['$de::module::a', '$en::module::b']
        current_line   -- str e.g. $d
        cursor_column  -- int e.g. 3 (one ahead of last character)
    """

    # We are only interested into last variable and not whole line
    to_complete = current_line[0: cursor_column]

    if len(to_complete) < 2:
        return puppet_classes

    matches = []
    to_match = ''.join(to_complete.rpartition('$')[1:])
    for puppet_class in puppet_classes:
        if puppet_class.startswith(to_match):
            matches.append(puppet_class)

    return matches


if __name__ == '__main__':
    main()
