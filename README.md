# RubyRailway
Resources and skill development paths for Ruby on Rails developers.

## Setup
This app relies on the following dependencies:
* Ruby 2.3
* PostgreSQL

You'll need to run `bin/setup` to get the environment set up. 

## Testing 

### Testing Requirements
Run `rspec .` to run tests. 
Run `rubocop .` to ensure quality code.

### Testing Philosophy
Use the minimalist testing philosophy outlined by Sandi Metz in her [2013 Rails Conf talk](https://www.youtube.com/watch?v=URSWYvyc42M&t=1666s):
* Incoming Query Messages: Assert Result
* Incoming Command Messages: Assert Direct Public Side Effects
* Messages Sent to Self, Outgoing Query Messages: Don't Test
* Outgoing Command Messages: Expect to Send

This testing philosophy preserves responsibility of objects and avoids duplication and (sigh) bloated test suites.

### TODO
See Issues on repo: https://github.com/timkleier/rubyrailway/issues

## Project Vision
See the [Google Doc](https://docs.google.com/document/d/1kI4BAxBh_UVWNdYOBGdWOmAWaWUaaEGDxlOt6opz640/edit?usp=sharing)
