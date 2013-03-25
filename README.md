# Airport

Airport application enables you to print new planes and launch them one by one or in batch mode. Also you can view history of launched planes. Every plane takes 10-20 seconds to speed up and take out.

Sidekiq is the application's heart. It handles the "launching" state of the planes. You may vary amount of runways by altering count of sidekiq workers. Use `sidekiq -c 1` to emulate airport with single runway.
