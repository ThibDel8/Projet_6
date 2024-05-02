# Project_6 - SnowTricks Community Site

## Project Overview
This project involves the creation of a community site dedicated to snowboard enthusiasts, aiming to facilitate the learning and sharing of snowboarding tricks. The site will allow users to browse a directory of snowboard tricks, contribute new tricks, and engage in discussions about each trick.

### Public Pages
1. **Home Page:**
   - Introduction to snowboarding
   - Navigation menu
   - List of snowboard tricks

2. **Individual Trick Page:**
   - Detailed information about a specific snowboard trick
   - Description of the trick
   - Author
   - Discussion section for users to share tips and experiences
   - List of comments

3. **User Authentication Pages:**
   - Registration and login pages for users
   - Only registered users can contribute new tricks or participate in discussions

## Site Map
- **Level 0: Home**
  - Description: Landing page introducing the snowboarding community site, featuring featured tricks.

- **Level 1: Trick Page**
   - Description: Page displaying the details of a specific snowboard trick.
   - Discussion Section
      - Description: Section allowing users to share tips and experiences about the trick.

- **Level 2: Trick Management**
   - Description: Page for trick management.
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
- Use case, class, and sequence diagrams are available in the "diagrammes" folder.

- **Navigation (Accessible on any page)**
   - Login/Registration
      - Description: Page for user authentication and registration.
   - Tricks list

## Issues
- Find the complete list of project-related issues on the [GitHub Issues page](https://github.com/ThibDel8/Projet_6/issues).

## Code Quality Analysis
- [Link to SymfonyInsight Analysis](https://insight.symfony.com/projects/2dfccf5a-8697-4260-a5aa-50fb5cd4d9cb)

## Contributors
- Delattre Thibault

## License
This project is under the MIT license. See the [LICENSE.md](LICENSE.md) file for more information.
