<a name="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">

<h3 align="center">CoderComm</h3>

  <p align="center">
    A full-stack MERN social media application developed using CRUD operations and follows RESTful APIs.
    <br />
    <br />
    <br />
    <a href="https://codercomm-tau.vercel.app/">View Demo</a>
    ·
    <a href="https://github.com/BahnMiFPS/codercomm/issues">Report Bug</a>
    ·
    <a href="https://github.com/BahnMiFPS/codercomm/issues">Request Feature</a>

  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#user-stories">User Stories</a>
      <ul>
        <li><a href="#authentication">Authentication</a></li>
        <li><a href="#users">Users</a></li>
        <li><a href="#posts">Posts</a></li>
        <li><a href="#comments">Comments</a></li>
        <li><a href="#reactions">Reactions</a></li>
        <li><a href="#friends">Friends</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li><a href="#contact">Contact</a></li>

  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

[![Product Name Screen Shot][product-screenshot]](https://codercomm-tau.vercel.app/)

Each user should provide a name, an email, and a password to create an account. The email address should not link to any account in the system.

After joining CoderComm, users can update their profile info like Avatar, Company, JobTitle, Social Links, and a short description about themselves

Users can write posts that contain text content and an image. The new posts will be shown on the user profile page, allowing other users to comment. Users can also react with like or dislike on a post or a comment.

Users can send friend requests to other users who have an open relationship with them. Users can accept or decline a friend request. After accepting a friend request, both become friends, and they can see posts of each other.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

##### Frontend:

[![React.js](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)](https://reactjs.org/)
[![Redux](https://img.shields.io/badge/Redux-764ABC?style=for-the-badge&logo=redux&logoColor=white)](https://redux.js.org/)
[![Axios](https://img.shields.io/badge/Axios-007ACC?style=for-the-badge&logo=axios&logoColor=white)](https://axios-http.com/)
[![Material-UI](https://img.shields.io/badge/Material--UI-0081CB?style=for-the-badge&logo=material-ui&logoColor=white)](https://material-ui.com/)
[![React Router](https://img.shields.io/badge/React_Router-CA4245?style=for-the-badge&logo=react-router&logoColor=white)](https://reactrouter.com/)

##### Backend:

[![JWT](https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=jsonwebtokens&logoColor=white)](https://jwt.io/)
[![Express.js](https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com/)
[![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white)](https://www.mongodb.com/)
[![Mongoose](https://img.shields.io/badge/Mongoose-880000?style=for-the-badge&logo=mongoose&logoColor=white)](https://mongoosejs.com/)
[![Bcrypt](https://img.shields.io/badge/bcrypt-004880?style=for-the-badge&logo=bcrypt&logoColor=white)](https://github.com/kelektiv/node.bcrypt.js#readme)

## User Stories

### Authentication

- As a user, I can register for a new account with my name, email and password.
- As a user, I can sign in with my email and password.
- As a user, I can stay signed in after refreshing page.

### Users

- As a user, I can see a list of other users so that I can send, accept or decline friend requests.
- As a user, I can see the profile of a specific user given a userID
- As a user, I can get my current profile info, and updated allowed fields such as Avatar, Company, Job Title, Social Links, and bio.

### Posts

- As a user, I can see a list of posts
- As a user, I can create a new posts.
- As a user, I can edit my posts.
- As a user, I can delete my posts.

### Comments

- As a user, I can see a list of comments on a post.
- As a user, I can write new comments on a post.
- As a user, I can edit my comments.
- As a user, I can delete my comments.

### Reactions

- As a user, I can react to a post or a comment with "Like" or "Dislike"

### Friends

- As a user, I can send a friend request to another user who is not my friend.
- As a user, I can see a list of friend requests I have received.
- As a user, I can see a list of friend requests I have sent.
- As a user, I can see my friendlist.
- As a user, I can accept or decline a friend request.
- As a user, I can cancel a friend request that I sent.
- As a user, I can remove somebody from my friendlist.

## Getting Started

### Client:

- Clone this repo `https://github.com/BahnMiFPS/codercomm`
- Register for a [Cloudinary](https://cloudinary.com/) account. And create a **unsigned** upload preset: https://cloudinary.com/documentation/upload_presets
- Create `/.env`:

```
REACT_APP_BACKEND_API='https://codercomm-be-production.up.railway.app/api/ or http://localhost:5000/api/'
REACT_APP_CLOUDINARY_CLOUD_NAME = 'cloudinary-cloud-name'
REACT_APP_CLOUDINARY_UPLOAD_PRESET = 'cloudinary-upload-preset'
```

The upload preset of your cloudinary should be **unsigned**.

- Run `npm install`

### Server:

- Clone this repo `https://github.com/BahnMiFPS/coderComm-be`
- Create `/.env`:

```
PORT=5000
MONGODB_URI='replace_this_with_your_mongodb_uri'
JWT_SECRET_KEY="replace_this_with_a_secret_key_for_jwt_auth"
```

- Run `npm run dev`

<!-- ROADMAP -->

## Contact

Quang Vu Luong - [@LinkedIn](https://linkedin.com/in/quangvu-dev) - luongquangvu97@gmail.com

Project Link: [https://github.com/BahnMiFPS/codercomm](https://github.com/BahnMiFPS/codercomm)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/BahnMiFPS/tuneteasers.svg?style=for-the-badge
[contributors-url]: https://github.com/BahnMiFPS/codercomm/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/BahnMiFPS/tuneteasers.svg?style=for-the-badge
[forks-url]: https://github.com/BahnMiFPS/codercomm/network/members
[stars-shield]: https://img.shields.io/github/stars/BahnMiFPS/tuneteasers.svg?style=for-the-badge
[stars-url]: https://github.com/BahnMiFPS/codercomm/stargazers
[issues-shield]: https://img.shields.io/github/issues/BahnMiFPS/tuneteasers.svg?style=for-the-badge
[issues-url]: https://github.com/BahnMiFPS/codercomm/issues
[license-shield]: https://img.shields.io/github/license/BahnMiFPS/tuneteasers.svg?style=for-the-badge
[license-url]: https://github.com/BahnMiFPS/codercomm/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/quangvu-dev
[product-screenshot]: https://i.imgur.com/310fXG9.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com
