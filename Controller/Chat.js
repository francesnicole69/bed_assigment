// tests/chatController.test.js
const { ChatModel } = require('../models/ChatModel');
const ChatController = require('../controllers/chatController');
jest.mock('../models/ChatModel'); // Mock the entire model

describe('ChatController.getPaginatedChats', () => {
  it('should return paginated chats', async () => {
    // Mock the model's response
    ChatModel.findAndCountAll.mockResolvedValue({
      count: 2,
      rows: [{ id: 1, ask: "Hello" }]
    });

    const req = { query: { page: 1, limit: 10 } };
    const res = { json: jest.fn() };

    await ChatController.getPaginatedChats(req, res);
    
    // Verify the controller formats the response correctly
    expect(res.json).toHaveBeenCalledWith({
      count: 2,
      rows: [{ id: 1, ask: "Hello" }],
      currPage: 1,
      pageSize: 10
    });
  });

  it('should handle DB errors', async () => {
    ChatModel.findAndCountAll.mockRejectedValue(new Error("DB crashed!"));
    const res = { status: jest.fn().mockReturnThis(), send: jest.fn() };

    await ChatController.getPaginatedChats({ query: {} }, res);
    expect(res.status).toHaveBeenCalledWith(500);
  });
});