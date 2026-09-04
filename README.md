# PROGPOE
# RaceDay Management System

## Project Overview

The RaceDay Management System is a database-driven event management solution designed to support the organisation and administration of races, walks, cycling events, participant registrations, event categories, and participant results.

The system supports two main user types: Event Organisers and Participants. Event Organisers manage RaceDay events, while Participants register for events and have their registrations and results recorded.

The project consists of an Entity Relationship Diagram , a SQL database implementation, and an API Endpoint Plan.

## System Purpose

The purpose of the RaceDay Management System is to keep important event and participant information in a structured relational database.

The system is designed to support:

- Creating and managing RaceDay events.
- Assigning events to event organisers.
- Grouping events into categories.
- Registering participants for events.
- Tracking registration status.
- Recording participant results.
- Maintaining relationships between organisers, events, categories, registrations, participants, and results.

## User Roles

### Event Organiser

An Event Organiser is responsible for creating and managing RaceDay events. An organiser can be associated with multiple events.

Organiser information includes:

- ORGANISER_ID
- ORGANISER_NAME
- EMAIL
- ORGANISATION

### Participant

A Participant is an individual who enters RaceDay events.

Participant information includes:

- PARTICIPANT_ID
- PARTICIPANT_NAME
- PARTICIPANT_SURNAME
- EMAIL

A participant can register for multiple events through the `ENTRY_REGISTRATION` table.

## Main Database Entities

| Entity | Purpose |
|---|---|
| `EVENT_ORGANISER` | Stores information about event organisers and their organisations. |
| `RACEDAY_EVENT` | Stores information about individual RaceDay events. |
| `CATEGORY` | Stores the different event categories. |
| `PARTICIPANT` | Stores participant information. |
| `ENTRY_REGISTRATION` | Records a participant's registration for an event. |
| `PARTICIPANT_RESULT` | Stores result records associated with event registrations. |

## Database Relationships

### Event Organiser → RaceDay Event

One event organiser can organise multiple events, while each event is associated with an organiser.

`EVENT_ORGANISER (1) → (many) RACEDAY_EVENT`

`RACEDAY_EVENT.ORGANISER_ID` references `EVENT_ORGANISER.ORGANISER_ID`.

### Category → ENTRY REGISTRATION

A category can be associated with multiple entries, while an one entry belongs to a category.

`CATEGORY (1) → (many) ENTRY_REGISTRATION

`ENTRY_REGISTRATION.CATEGORY_ID` references `CATEGORY.CATEGORY_ID`.

### Participant → Entry Registration

A participant can have multiple registrations because the same participant may enter different events.

`PARTICIPANT (1) → (many) ENTRY_REGISTRATION`

### RaceDay Event → Entry Registration

An event can have multiple registrations.

`RACEDAY_EVENT (1) → (many) ENTRY_REGISTRATION`

The registration table therefore connects participants with events.



## Database Tables

### `EVENT_ORGANISER`

Stores the details of people responsible for RaceDay events.

**Fields:**

- `ORGANISER_ID` — Primary Key
- `ORGANISER_NAME` — Organiser's name
- `EMAIL` — Organiser email address
- `ORGANISATION` — Organisation represented by the organiser

### `CATEGORY`

Stores the different types of RaceDay events.

**Fields:**

- `CATEGORY_ID` — Primary Key
- `CATEGORY_NAME` — Category name
- `ENTRY_REQUIREMENTS` — Requirements for participants
- `CATEGORY_DESCRIPTION` — Description of the category

### `RACEDAY_EVENT`

Stores information about individual RaceDay events.

**Fields:**

- `EVENT_ID` — Primary Key
- `EVENT_NAME` — Name of the event
- `EVENT_DATE` — Date of the event
- `DURATION` — Expected duration
- `VENUE` — Event venue
- `ORGANISER_ID` — Foreign Key to `EVENT_ORGANISER`
- `CATEGORY_ID` — Foreign Key to `CATEGORY`

### `PARTICIPANT`

Stores information about participants.

**Fields:**

- `PARTICIPANTID` — Primary Key
- `PARTICIPANT_NAME` — Participant name
- `PARTICIPANT_SURNAME` — Participant surname
- `EMAIL` — Participant email address

### `ENTRY_REGISTRATION`

Stores participant registrations for RaceDay events.

**Fields:**

- `ENTRY_ID` — Primary Key
- `PARTICIPANT_ID` — Foreign Key intended to reference `PARTICIPANT`
- `EVENT_ID` — Foreign Key to `RACEDAY_EVENT`
- `ENTRY_STATUS` — Current registration status

Example statuses include:

- `PENDING`
- `REGISTERED`

### `PARTICIPANT_RESULT`

Stores results associated with event registrations.

**Fields:**

- `RESULTS_ID` — Primary Key
- `ENTRY_ID` — Foreign Key to `ENTRY_REGISTRATION`

## Sample Data

The SQL script contains sample records to demonstrate the database design.

### Sample organisers

The sample database includes organisers representing organisations such as:

- HERArchive
- ABSA
- TLABS
- SAPS

### Sample categories

Example categories include:

- Community walks
- Park runs
- Charity cycling

### Sample events

Example RaceDay events include:

- Cape Town Cycle Tour
- Soweto Marathon
- Two Oceans

The sample data demonstrates how organisers, categories, events, registrations, participants, and results are connected.

## API Endpoint Overview

The API is planned around the main functions of the RaceDay system.

| Area | Example Endpoint | Purpose |
|---|---|---|
| Authentication | `POST /api/auth/register` | Register a new user. |
| Authentication | `POST /api/auth/login` | Authenticate a user. |
| User Profile | `GET /api/users/me` | Retrieve the logged-in user's profile. |
| Events | `GET /api/events` | View available/upcoming events. |
| Events | `GET /api/events/{id}` | View a specific event. |
| Events | `POST /api/events` | Create an event. |
| Events | `PUT /api/events/{id}` | Update an event. |
| Events | `DELETE /api/events/{id}` | Delete an event. |
| Categories | `GET /api/categories` | View event categories. |
| Categories | `POST /api/categories` | Create a category. |
| Enrolments | `POST /api/events/{eventId}/enrolments` | Register a participant for an event. |
| Enrolments | `GET /api/enrolments/me` | View the participant's enrolments. |
| Results | `GET /api/results/me` | View the participant's results/history. |
| Results | `GET /api/events/{eventId}/results` | View results for an event. |
| Results | `POST /api/events/{eventId}/results` | Add a result. |

The API separates functionality according to user responsibilities. Event-management operations are primarily intended for Event Organisers, while participants use enrolment and result functionality.

## Technologies and Concepts

- **SQL** — Used to create and manage the relational database.
- **Relational database design** — Used to structure the RaceDay data.
- **ERD (Entity Relationship Diagram)** — Used to model entities and their relationships.
- **REST API design** — Used to define how applications interact with the RaceDay system.
- **Visual Paradigm** — Used to create the ERD.

## Database Setup

To set up the database:

1. Open a SQL Server-compatible database management environment.
2. Create the `RACEDAY_MANAGEMENT_SYSTEM` database.
3. Create the tables in dependency order:
   - `EVENT_ORGANISER`
   - `CATEGORY`
   - `RACEDAY_EVENT`
   - `PARTICIPANT`
   - `ENTRY_REGISTRATION`
   - `PARTICIPANT_RESULT`
4. Insert the sample data after the required tables have been created.
5. Verify the foreign-key relationships and sample records.

The table creation order is important because some tables reference records in tables that must already exist.

## Data Integrity

Primary keys uniquely identify records in each table.

Foreign keys maintain relationships between related records. The intended relationships include:

- `RACEDAY_EVENT.ORGANISER_ID` → `EVENT_ORGANISER.ORGANISER_ID`
- `RACEDAY_EVENT.CATEGORY_ID` → `CATEGORY.CATEGORY_ID`
- `ENTRY_REGISTRATION.EVENT_ID` → `RACEDAY_EVENT.EVENT_ID`
- `ENTRY_REGISTRATION.PARTICIPANT_ID` → `PARTICIPANT.PARTICIPANTID`
- `PARTICIPANT_RESULT.ENTRY_ID` → `ENTRY_REGISTRATION.ENTRY_ID`

This structure helps prevent registrations and results from referring to records that do not exist.

## SQL Implementation Notes

The supplied SQL demonstrates the intended database structure, but a few implementation details should be corrected or checked before execution.

### Date values

`RACEDAY_EVENT.EVENT_DATE` is currently defined as `VARCHAR`. A `DATE` data type would be more appropriate for a production implementation.

Date values should be supplied as valid SQL date literals, for example:

```sql
'2026-06-05'
```

rather than an unquoted expression such as:

```sql
05-06-2026
```

### Participant foreign key

`ENTRY_REGISTRATION.PARTICIPANT_ID` should use the same integer data type as `PARTICIPANT.PARTICIPANTID` and should have a foreign-key constraint referencing the participant table.

### Participant result foreign key

The `PARTICIPANT_RESULT` table definition should include the required comma before its foreign-key constraint.

These changes do not alter the overall database concept; they ensure that the SQL implementation correctly enforces the relationships shown in the ERD.

## Example System Flow

A typical RaceDay process is:

1. An **Event Organiser** is recorded in the system.
2. The organiser creates a **RaceDay Event**.
3. The event is assigned to a **Category**.
4. A **Participant** registers for the event.
5. An `ENTRY_REGISTRATION` record is created with the participant, event, and registration status.
6. After the event, a result can be associated with the participant's registration.
7. The participant can access their participation and result history through the API.

## Design Assumptions

The following assumptions were made in the database and API design:

- Event Organisers and Participants are treated as separate user types.
- Each RaceDay event is managed by an Event Organiser.
- Each RaceDay event belongs to a category.
- A participant can enter multiple events.
- An event can have multiple participants.
- `ENTRY_REGISTRATION` resolves the participant-to-event relationship.
- Results are associated with registrations rather than directly with participants.
- A participant may not have a result immediately after registering.
- Event browsing is treated as a system function using event data rather than as a separate database entity.
- Live weather and route information can be supplied through external/API functionality rather than requiring separate core database tables.

## Future Improvements

Possible future improvements include:

- Secure password storage and token-based authentication.
- More detailed participant profiles.
- Race numbers and payment information.
- Detailed result information such as finish time and finishing position.
- Dedicated route information for each event.
- Live weather integration.
- Event search and filtering.
- Notifications for registrations and event updates.
- Administrative reports and statistics.
- Validation to prevent duplicate registrations for the same participant and event.

## Project Deliverables

The RaceDay Management System consists of three related deliverables:

1. **ERD** — Defines the entities, attributes, keys, and relationships.
2. **SQL Database Script** — Implements the relational database structure and sample data.
3. **API Endpoint Plan** — Defines the REST endpoints used to interact with the system.

The three deliverables should remain consistent. Changes to an entity or relationship in the ERD should also be reflected in the SQL database and, where necessary, in the API design.

## Conclusion

The RaceDay Management System provides a structured database solution for managing sporting and community events. Separating organisers, participants, events, categories, registrations, and results into related entities makes the information easier to manage and provides a clear foundation for an API-driven application.

The ERD provides the conceptual model, the SQL script provides the database implementation, and the API Endpoint Plan provides the interface through which applications can interact with the system.
