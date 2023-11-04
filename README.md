# vod-portal
Gateway server to cloud hosted vod-service

Tentative structure:
**api**: This directory might contain API-related code or documentation.
**configs**: Configuration files for the application, settings, or other configuration-related data could be stored here.
**githooks**: Git hook scripts, which can be used to automate actions before or after Git commands, may be placed here.
**pkg**: The `pkg` directory can contain shared code that is intended to be used by other parts of the project.
**scripts**: Utility scripts or build-related scripts may be placed here.
**third_party**: Code or libraries from third-party sources that are used in the project.
**vendor**: If you're using dependency management systems like Go Modules or Dep, this directory might be used to store vendored dependencies.

TODO:
    seperate endpoints into domains

Api Endpoints:
    Video Listing Endpoint:
        Endpoint: /videos
        Explanation: This endpoint provides a list of available videos on the platform. You may allow filtering and sorting options, such as category, date, or popularity.
        Conditions: Can be accessed publicly, but you might implement authentication to track user preferences and history.

    Video Detail Endpoint:
        Endpoint: /videos/{id}
        Explanation: Retrieve detailed information about a specific video, including its title, description, duration, and related metadata.
        Conditions: Accessible to everyone. Permissions may be required for restricted content.

    Video Playback Endpoint:
        Endpoint: /videos/{id}/play
        Explanation: Allows users to play the video. It might return the video stream, or you can use streaming protocols like HLS or DASH.
        Conditions: Typically, public access, but you can implement authentication to track user views.

    Search Endpoint:
        Endpoint: /search
        Explanation: Enables users to search for videos based on keywords, tags, or categories.
        Conditions: Available to everyone. Usage limits might apply for non-registered users.

    User Registration Endpoint:
        Endpoint: /users/register
        Explanation: Allows users to create an account on the platform.
        Conditions: Restricted to unregistered users. May require validation, email confirmation, or other security measures.

    User Login Endpoint:
        Endpoint: /users/login
        Explanation: Authenticate registered users to access their personalized content, such as history, playlists, and preferences.
        Conditions: Accessible to registered users with correct credentials.

    User Profile Endpoint:
        Endpoint: /users/profile
        Explanation: Retrieve user profile information and settings.
        Conditions: Accessible to registered and authenticated users.

    Video Upload Endpoint:
        Endpoint: /videos/upload
        Explanation: Enables content creators to upload videos to the platform.
        Conditions: Restricted to authorized content creators. May require video moderation.

    Content Management Endpoint:
        Endpoint: /videos/{id}/edit or /videos/{id}/delete
        Explanation: Allows content creators to edit or delete their videos.
        Conditions: Available to content creators and administrators.

    |-------------------------- Additional Ideas --------------------------|

    Favorites/Watchlist Endpoint:
        Endpoint: /users/favorites or /users/watchlist
        Explanation: Allows users to add or remove videos from their favorites or watchlist.
        Conditions: Accessible to registered and authenticated users.

    Comments and Ratings Endpoint:
        Endpoint: /videos/{id}/comments or /videos/{id}/ratings
        Explanation: Allows users to leave comments or ratings for videos.
        Conditions: Usually available to registered and authenticated users.

    Analytics and Statistics Endpoint:
        Endpoint: /videos/{id}/analytics
        Explanation: Provides insights into video performance, views, engagement, and audience demographics.
        Conditions: Typically available to content creators and administrators.

    Categories and Genres Endpoint:
        Endpoint: /categories or /genres
        Explanation: Lists available video categories or genres for better content organization.
        Conditions: Accessible to everyone for discovery purposes.

    Content Moderation Endpoint:
        Endpoint: /moderation/reports or /moderation/review
        Explanation: Allows users to report inappropriate content, and administrators to review and moderate flagged content.
        Conditions: Restricted to users who want to report content and to administrators for review.

    Subscription and Notifications Endpoint:
        Endpoint: /users/subscribe or /users/notifications
        Explanation: Allows users to subscribe to channels, receive notifications, and stay updated on new video uploads.
        Conditions: Accessible to registered and authenticated users.
