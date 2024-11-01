List<Map<String, dynamic>> tasks = [
  // Work - High Priority
  {
    'title': 'Finish quarterly report for the management team',
    'description': 'Complete the report covering Q3 performance',
    'category': 1,
    'priority': 3,
    'completed': 0,
  },
  {
    'title': 'Prepare presentation for client meeting on Friday',
    'description': 'Create a PowerPoint for the upcoming client pitch',
    'category': 1,
    'priority': 3,
    'completed': 0,
  },
  {
    'title': 'Submit project proposal for new software feature',
    'description':
        'Write and submit the proposal for the upcoming software feature',
    'category': 1,
    'priority': 3,
    'completed': 0,
  },

  // Work - Medium Priority
  {
    'title': 'Reply to important client emails by end of day',
    'description': 'Respond to client questions and queries',
    'category': 1,
    'priority': 2,
    'completed': 0,
  },
  {
    'title': 'Schedule team meeting for next week’s project review',
    'description': 'Coordinate with team members and book a conference room',
    'category': 1,
    'priority': 2,
    'completed': 0,
  },
  {
    'title': 'Complete code review for John’s new feature',
    'description': 'Look over the feature code and provide feedback',
    'category': 1,
    'priority': 2,
    'completed': 0,
  },

  // Work - Low Priority
  {
    'title': 'Organize desk and declutter workspace',
    'description': 'Clean up and reorganize work materials',
    'category': 1,
    'priority': 1,
    'completed': 0,
  },
  {
    'title': 'Update project documentation for future reference',
    'description': 'Ensure all project docs are up to date in the repository',
    'category': 1,
    'priority': 1,
    'completed': 0,
  },
  {
    'title': 'Clean up old files and folders on the work computer',
    'description': 'Delete unnecessary files and folders from the system',
    'category': 1,
    'priority': 1,
    'completed': 0,
  },

  // Personal - High Priority
  {
    'title': 'Plan and book the family vacation for December',
    'description': 'Choose destination and book flights and accommodation',
    'category': 2,
    'priority': 3,
    'completed': 0,
  },
  {
    'title': 'Pay utility bills before the due date',
    'description':
        'Make sure all bills (electricity, water, internet) are paid',
    'category': 2,
    'priority': 3,
    'completed': 0,
  },
  {
    'title': 'Renew car insurance by the end of the week',
    'description': 'Contact the insurance company and renew coverage',
    'category': 2,
    'priority': 3,
    'completed': 0,
  },

  // Personal - Medium Priority
  {
    'title': 'Buy groceries for the week',
    'description': 'Purchase milk, bread, vegetables, and other essentials',
    'category': 2,
    'priority': 2,
    'completed': 0,
  },
  {
    'title': 'Schedule a dentist appointment for next month',
    'description': 'Call the dentist office and book an appointment',
    'category': 2,
    'priority': 2,
    'completed': 0,
  },
  {
    'title': 'Call the plumber to fix the kitchen sink',
    'description': 'Arrange for a plumber to come over and repair the sink',
    'category': 2,
    'priority': 2,
    'completed': 0,
  },

  // Personal - Low Priority
  {
    'title': 'Organize books on the shelf in the living room',
    'description': 'Sort and rearrange books on the shelf',
    'category': 2,
    'priority': 1,
    'completed': 0,
  },
  {
    'title': 'Clean out and organize the kitchen pantry',
    'description': 'Remove expired items and reorganize pantry shelves',
    'category': 2,
    'priority': 1,
    'completed': 0,
  },
  {
    'title': 'Catch up on missed episodes of your favorite TV show',
    'description': 'Watch the latest episodes of the series',
    'category': 2,
    'priority': 1,
    'completed': 0,
  },

  // Fitness - High Priority
  {
    'title': 'Attend personal training session on Thursday morning',
    'description': 'Be on time for the scheduled session at the gym',
    'category': 4,
    'priority': 3,
    'completed': 0,
  },
  {
    'title': 'Complete the 10K run for the upcoming charity event',
    'description': 'Train and run the 10K event for charity',
    'category': 4,
    'priority': 3,
    'completed': 0,
  },
  {
    'title': 'Sign up for the monthly yoga class at the local gym',
    'description': 'Register and attend the monthly yoga sessions',
    'category': 4,
    'priority': 3,
    'completed': 0,
  },

  // Fitness - Medium Priority
  {
    'title': 'Go for a 5-mile run after work tomorrow',
    'description': 'Plan a run around the neighborhood after work',
    'category': 4,
    'priority': 2,
    'completed': 0,
  },
  {
    'title': 'Do a 30-minute strength training workout at home',
    'description': 'Use dumbbells and bodyweight exercises for the workout',
    'category': 4,
    'priority': 2,
    'completed': 0,
  },
  {
    'title': 'Try a new healthy recipe for dinner tonight',
    'description': 'Cook a nutritious meal from a new recipe',
    'category': 4,
    'priority': 2,
    'completed': 0,
  },

  // Fitness - Low Priority
  {
    'title': 'Take a 15-minute evening walk around the neighborhood',
    'description': 'Relax with a casual walk after dinner',
    'category': 4,
    'priority': 1,
    'completed': 0,
  },
  {
    'title': 'Watch a new fitness video on stretching techniques',
    'description': 'Learn new stretches from an online tutorial',
    'category': 4,
    'priority': 1,
    'completed': 0,
  },

  // Family - High Priority
  {
    'title': 'Attend parent-teacher conference at school',
    'description': 'Discuss child’s progress with their teachers',
    'category': 3,
    'priority': 3,
    'completed': 0,
  },
  {
    'title': 'Prepare for family reunion next weekend',
    'description': 'Help organize activities and book the venue',
    'category': 3,
    'priority': 3,
    'completed': 0,
  },
  {
    'title': 'Take child to doctor’s appointment on Monday',
    'description': 'Ensure all medical checkups are completed',
    'category': 3,
    'priority': 3,
    'completed': 0,
  },

  // Family - Medium Priority
  {
    'title': 'Plan family game night this Friday',
    'description': 'Pick games and snacks for the evening',
    'category': 3,
    'priority': 2,
    'completed': 0,
  },
  {
    'title': 'Buy a birthday gift for niece’s birthday',
    'description': 'Find a meaningful present for the upcoming celebration',
    'category': 3,
    'priority': 2,
    'completed': 0,
  },
  {
    'title': 'Help kids with homework over the weekend',
    'description': 'Assist with school projects and assignments',
    'category': 3,
    'priority': 2,
    'completed': 0,
  },

  // Family - Low Priority
  {
    'title': 'Organize old family photos into albums',
    'description': 'Sort through photos and create a family album',
    'category': 3,
    'priority': 1,
    'completed': 0,
  },
  {
    'title': 'Teach kids how to bake a simple cake',
    'description': 'Plan a baking activity with the children',
    'category': 3,
    'priority': 1,
    'completed': 0,
  },
  {
    'title': 'Set up a movie night with family over the weekend',
    'description': 'Pick a movie and arrange snacks for the family',
    'category': 3,
    'priority': 1,
    'completed': 0,
  }
];
