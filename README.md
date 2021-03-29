Tasks (some doubles)

- [] It should be configurable, enabling the user to set the settings which are documented https://docs.simpleanalytics.com/overwrite-domain-name
- [] It should be available on https://rubygems.org/ - After delivery, I'll run you though how to release new version and such (I'll also documented this in the repo).
- [] I'll push my code to https://github.com/simpleanalytics/rubyonrails-plugin
- [] I've estimated 1 day of development time at £350. I'll invoice you after delivery.
- [] In future version, we'd like to be able to include more of the tracking options. We'll discuss this after the first version is delivered.
- [] Have the CDN version of the script embedded
- [] Make the domain customizable in the plugin settings (or the most common way to do this in RoR)
- [] Follow the RoR conventions
- [] Expose the "sa_event" function before the script loads:

    ```
    window.sa_event=window.sa_event||function(){a=[].slice.call(arguments);sa_event.q?sa_event.q.push(a):sa_event.q=[a]};
    ```

- [] The script will replace that function when loaded
- [] Make sure it works well with Turbolinks (some customers experienced double page views when using Turbolinks; they probably had our script in their body of the page).
