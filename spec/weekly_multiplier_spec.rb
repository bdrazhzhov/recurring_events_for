require File.dirname(__FILE__) + '/helper'

describe 'Weekly generation' do

  it 'should generate weekly events with 2 weeks separation' do
    executing([
                  "insert into events (id, starts_at, ends_at, frequency, separation) values (1, '2016-10-28 11:00', '2016-10-25 13:00', 'weekly', 2);",
                  'insert into event_recurrences (event_id, day) values (1, 1), (1, 5);',
                  "select starts_at from recurring_events_for('2016-10-24', '2016-11-06', 'UTC', NULL);"
              ]).should == [
        ['2016-10-28 11:00:00'],
        ['2016-10-31 11:00:00']
    ]
  end
end