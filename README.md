# Visit Tracker

The Idea of this app is to build a Visits Tracker feature for a Route-to-Market (RTM) Sales Force
Automation app.

Upon completion, the app is supposed to help in: 

● Adding a new visit by filling out a form

● Viewing a list of customer visits

● Track activities completed during the visit

● View basic statistics related to visits (e.g., how many completed)

---

## Screenshots

### Dashboard
when a user logs into the car, this is the dashboard that will be able to see.

on the dashboard, they will be able to see all the visits that they have made so far, visits completed and the ones they have scheduled.

On this particular section, the user will also have a quick button to access all the visits list or add a new visit.

Also, the last five visit details can also be acessed fromt this page.

users can also use the bottom navigation bar to acces these pages.


![dashboard](/route_tracker/assets/images/dashboard.png)


## Customer Section.

In the short implemetation I have done, I have also added a section for adding a new visit, this page will be used to record all the deatils of the visit.

### Customer Information Section
![Customer Info](/route_tracker/assets/images/add_visit.png)

### Visit Details Section
![Visit Details](/route_tracker/assets/images/add_visit_2.png)


## Visited Business

In this particular section, the user will be able to access all the visits, based on the caregories, all visits, completed visits and scheduled visits.

The user will also be able to search for a spacific visit.

![Deatailed Activities](/route_tracker/assets/images/all_visit.png)

### Additional Notes & Actions

So far I have been able to just work on the basic information of the app just to show th idea.

---
## 🛠️ Features

- Text input fields for customer name, location, and notes
- Dropdowns for customer type, purpose, and status
- Planned activities input
- Save/Cancel actions
- Submits data to backend via HTTP POST request

---

## Getting Started

1. **Clone the repo:**
   ```bash
   https://github.com/blackoaz/paulo-solutech.git 

   cd route_traker
   ```

2. **Create  .env file:**

   ```bash
      create a .env file and store it under assets/.env
      add the following key values pair data

      API_KEY="{SUPABASE_API_KEY}"

      SUPABASE_URL="{SUAPABASE_BASE_URL/}"
   ```

3. **Run the App**

   While building this, I ran it using the web, i.e chrome, but you can run it using android simulator or ios simulator.

   ```bash
      flutter run
   ````