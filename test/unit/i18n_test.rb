require 'i18n/tasks'

class I18nTest < ActiveSupport::TestCase
  setup do
    @i18n = I18n::Tasks::BaseTask.new
  end

  test 'no missing keys' do
    missing_keys = @i18n.missing_keys

    assert_empty missing_keys,
                 "Missing #{missing_keys.leaves.count} i18n keys, run `i18n-tasks missing' to show them"
  end

  test 'no unused keys' do
    unused_keys = @i18n.unused_keys

    assert_empty unused_keys,
                 "#{unused_keys.leaves.count} unused i18n keys, run `i18n-tasks unused' to show them"
  end

  test 'files are normalized' do
    non_normalized = @i18n.non_normalized_paths
    error_message = "The following files need to be normalized:\n" \
                    "#{non_normalized.map { |path| "  #{path}" }.join("\n")}\n" \
                    "Please run `i18n-tasks normalize' to fix"

    assert_empty non_normalized, error_message
  end

  test 'no inconsistent interpolations' do
    inconsistent_interpolations = @i18n.inconsistent_interpolations
    error_message = "#{inconsistent_interpolations.leaves.count} i18n keys have inconsistent interpolations.\n" \
                    "Please run `i18n-tasks check-consistent-interpolations' to show them"

    assert_empty inconsistent_interpolations, error_message
  end
end
