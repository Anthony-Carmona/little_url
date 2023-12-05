# URL Shortener Backend Service

## Overview

Welcome to the Little URL Backend Service! This service is built using Ruby on Rails and PostgreSQL to provide a robust and efficient solution for shortening long URLs. It enables users to create shortened versions of URLs, making them more convenient and easy to share.

## Features

- **Shorten URLs:** Easily shorten long URLs to create concise and shareable links.

## Setup

Follow these steps to set up the URL Shortener Backend Service locally:

1. **Clone the Repository:**
   ```bash
   git clone git@github.com:Anthony-Carmona/little_url.git
   cd little_url
   ```

2. **Install Dependencies:**
   ```bash
   bundle install
   ```

3. **Database Setup:**
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Run the Server:**
   ```bash
   rails server
   ```

5. **Access the Service:**
the service by default will run on http://localhost:3000

## Usage
use the API endpoint to shorten a URL:

1. **Shorten a url:**
use the 
   ```
   POST /sites
   ```
endpoint

2. **retrieve a long url:**
use the 
   ```
   GET /:long_url
   ```
endpoint





