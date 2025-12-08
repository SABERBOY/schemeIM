
import { UserProfile, Room, Message, GiftItem, SocialNode, MessageType } from './api_schema';
import { AVATAR_FRAMES, GAMES, GIFTS, MOCK_CHATS } from './constants';

// Simulated Database
let CURRENT_USER: UserProfile = {
  id: 'user_123',
  displayName: 'Habibi King',
  avatarUrl: 'https://cdn-icons-png.flaticon.com/512/147/147142.png',
  frameUrl: AVATAR_FRAMES[1].image,
  goldBalance: 500,
  level: 5,
  isVerified: true,
  privacy: { showSocialList: true, showOnlineStatus: true },
  rank: { rankName: 'Noble', colorHex: '#CD7F32' }
};

export const API = {
  auth: {
    sendOtp: async (phone: string) => {
      return new Promise<{success: boolean}>(resolve => 
        setTimeout(() => resolve({ success: true }), 1000)
      );
    },
    login: async (phone: string, code: string) => {
      return new Promise<UserProfile>(resolve => 
        setTimeout(() => resolve(CURRENT_USER), 1000)
      );
    }
  },
  
  user: {
    getProfile: async () => CURRENT_USER,
    updateProfile: async (updates: Partial<UserProfile>) => {
      CURRENT_USER = { ...CURRENT_USER, ...updates };
      return CURRENT_USER;
    }
  },

  room: {
    list: async (): Promise<Room[]> => {
      return [
        { 
          id: '1', title: 'Dubai Chill 🌴', countryFlag: '🇦🇪', tags: ['Music', 'Chat'],
          host: { ...CURRENT_USER, id: 'h1', displayName: 'Ahmed', avatarUrl: 'https://cdn-icons-png.flaticon.com/512/4825/4825038.png', frameUrl: AVATAR_FRAMES[3].image },
          seats: [], onlineCount: 120, description: 'Best vibes in Dubai'
        },
        { 
          id: '2', title: 'Riyadh Nights 🌙', countryFlag: '🇸🇦', tags: ['Poetry'],
          host: { ...CURRENT_USER, id: 'h2', displayName: 'Sarah', avatarUrl: 'https://cdn-icons-png.flaticon.com/512/4825/4825112.png', frameUrl: '' },
          seats: [], onlineCount: 85, description: 'Poetry and Coffee'
        },
        { 
          id: '3', title: 'Cairo Vibes 🇪🇬', countryFlag: '🇪🇬', tags: ['Funny'],
          host: { ...CURRENT_USER, id: 'h3', displayName: 'Omar', avatarUrl: 'https://cdn-icons-png.flaticon.com/512/4825/4825044.png', frameUrl: AVATAR_FRAMES[2].image },
          seats: [], onlineCount: 200, description: 'Jokes all night'
        },
      ];
    },
    create: async (room: Partial<Room>) => {
      return room as Room;
    }
  },

  chat: {
    listContacts: async () => MOCK_CHATS,
    send: async (msg: Partial<Message>) => msg
  },
  
  economy: {
    listGifts: async () => GIFTS.map(g => ({
      id: g.id, name: g.name, iconChar: g.icon, cost: g.cost
    }))
  }
};
