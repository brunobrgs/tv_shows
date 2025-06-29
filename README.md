## Requirements

* Ruby 3.1.2
* PostgreSQL

## Setup

1. Install the gems

```
bundle install
```

2. Create and setup the database

```
rails db:create
rails db:migrate
```

3. Run tests

```
rspec
```

## TODO

- Store the optional `webChannel` from `tvmaze` response
- Treat rate limiting: API calls are rate limited to allow at least 20 calls every 10 seconds per IP address.
- Review indexes & include a short paragraph on why you chose them.
- Provide at least 3 sample analytical queries (CTE/window or aggregate).
- Deployment plan
- Update Readme (Trade-off notes + decisions)
- Schema diagram (ASCII or PNG)
- Use Redis for cache
- Create a presenter for the episode Json
- `Schedule.upsert!` might need to delete data before fetching data from date (in case schedule changes)
- Cache data from country/network in episodes to avoid joining the tables for filter
- Filter by network name should not be an exact match only
