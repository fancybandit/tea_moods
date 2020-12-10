
# How To Build A CLI Gem

1. Plan your gem / Imagine your interface
2. Create project structure (Google)
3. Create entry point (Run file)
4. Force that to build the CLI
5. Stub out interface
6. Make things real
7. Discover objects
8. Program

# Project Idea / Planning Session

1. User story
    - User: Person who enjoys drinking various teas
    - Pain point: User isn't feeling up to par. User wants to know what tea can help them feel better, whether they are looking for help with focus, stress relief, energy, nausea, etc.
    - Solution: User starts app & is greeted with a list of moods/effects they are looking for help with. User chooses a mood/effect & is shown a list of teas that pertain to that effect. User can select a tea to read a short despcription about it. User can then either go back to the teas, moods, or exit the app.

2. General info
    a. App function / User experience
        - CLI for displaying specific recommended teas to a user based on their selected mood.
    b. Data source (Website scrape)
        - Site: https://www.traditionalmedicinals.com/collection/benefit-all/
    c. What to do with scraped data
        - Create objects that the CLI will use to display information based on the user's input.
    d. What classes will you be using?
        - What roles would I hire for a human-run business? What are their responsibilities?
            1. Customer Service (CLI)
                - Gives user options, asks questions, and provides results.
            2. Tea Expert: Tea Categories(TeaMood)
                - Stores & maintains all tea instances in their respective category based on mood. CLI will display teas retrieved from this class. Inherits from 'Tea' class (see below).
            3. Tea Archivist: Individual Teas (Tea)
                - Creates & stores instances of all teas & their info that could potentially be displayed to the user based on their mood.
            4. Mood Specialist: Individual Moods (Mood)
                - Creates & stores instances of all moods &

            # The above 3 classes may/may not potentially be combined into fewer classes as development progresses

            5. Runner (Scraper)
                - Retrieves/Scrapes info from the tea website that will be used to create our tea objects for our app. Provides the info necessary for our app to display.
    e. How will you display data one level deep to the user?
        - User will be required to select a mood to view the list of relevant teas. User will also be required to select a tea in order to view a short description of the tea.

3. Flow diagram planning
    - https://drive.google.com/file/d/1kTzcJBGOeAxMqDQJ0p2dTvQislxcsHH1/view?usp=sharing

4. Data planning
    - What is a mood?
        - A mood has a name
        - A mood has teas
    - What is a tea?
        - A tea has a name
        - A tea has a description
        - A tea has ingredients
        - A tea belongs to a mood
        - A tea has a URL