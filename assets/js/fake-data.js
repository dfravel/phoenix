const DATA = {
  rooms: [
    {
      id: 1,
      counterpart: {
        id: 2,
        username: 'alice',
      },
      messages: [
        {
          id: 1,
          text: "What's up!",
          outgoing: true,
          sentAt: "1 hour ago",
        },
        {
          id: 2,
          text: "Nothing much - you?",
          outgoing: false,
          sentAt: "10 minutes ago",
        }
      ],
    },
  ],
};

export default DATA;