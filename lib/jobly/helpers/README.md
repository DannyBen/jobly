Note that although these files are in a separate folder, the modules they 
define are **using the main `Jobly` namespace** - so caution is required
when adding additional files.

This is done on purpose, since these modules may also be included by the
user, and we would like the users to have a simple `include Jobly::Slack`
rather than `include Jobly::Helpers::Slack`.

