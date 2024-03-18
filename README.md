# Project_6 - Snowboard Tricks Community Site

## Project Overview
This project involves the creation of a community site dedicated to snowboard enthusiasts, aiming to facilitate the learning and sharing of snowboarding tricks. The site will allow users to browse a directory of snowboard tricks, contribute new tricks, and engage in discussions about each trick.

### Public Pages
1. **Home Page:**
   - Introduction to snowboarding
   - Navigation menu
   - List of featured snowboard tricks
   - Contact form
   - Links to social media profiles

2. **Trick Directory Page:**
   - List of snowboard tricks
   - Each trick includes name, difficulty level, and a brief description
   - Link to the full details of each trick

3. **Individual Trick Page:**
   - Detailed information about a specific snowboard trick
   - Description of the trick
   - Author
   - Discussion section for users to share tips and experiences
   - List of approved comments

4. **User Authentication Pages:**
   - Registration and login pages for users
   - Only registered users can contribute new tricks or participate in discussions

### Administration Pages
1. **Add Trick Page:**
   - Form to add a new snowboard trick

2. **Edit Trick Page:**
   - Form to edit an existing snowboard trick

3. **Manage Tricks Pages:**
   - List of tricks with options to edit or delete each trick

### Footer Menu
- Link to the administration section of the site

## Site Map
- **Level 0: Home**
  - Description: Landing page introducing the snowboarding community site, featuring featured tricks, a contact form, and links to social media profiles.

- **Level 1: Trick Directory**
   - Description: Page displaying a directory of all snowboard tricks.

- **Level 2: Trick Page**
   - Description: Page displaying the details of a specific snowboard trick.
   - Discussion Section
      - Description: Section allowing users to share tips and experiences about the trick.

- **Level 3: Trick Management (Admin Only)**
   - Description: Page for trick management tasks.
   - Edit Trick
      - Description: Page to edit the details of a specific trick.
   - Delete Trick
      - Description: Delete the trick.

## Installation Instructions
1. Clone the repository: `git clone https://github.com/ThibDel8/Projet_6.git`
2. Set up the PHP environment and web server.
3. Import the database using the provided file.
4. Install dependencies with Composer: `composer install`
5. Configure database information in the `.env` file.
6. Start the server: `php -S localhost:8000 -t public/`

## UML Diagrams
- Use case, class, and sequence diagrams are available in the "diagrams" folder.

- **Footer (Accessible on any page)**
  - Description: Footer section with links to legal information (terms, cookies, privacy).

- **Navigation (Accessible on any page)**
   - Login/Registration
      - Description: Page for user authentication and registration.
   - Profile Page
      - Description: User profile page with the list of created tricks (with the option to edit or delete).
   - Social Networks
      - Description: links to social media pages

## Issues
- Find the complete list of project-related issues on the [GitHub Issues page](https://github.com/ThibDel8/Projet_6/issues).

## Code Quality Analysis
- [Link to SymfonyInsight Analysis](https://insight.symfony.com/projects/2dfccf5a-8697-4260-a5aa-50fb5cd4d9cb)

## Contributors
- Delattre Thibault

## License
This project is under the MIT license. See the [LICENSE.md](LICENSE.md) file for more information.
