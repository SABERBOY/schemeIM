
export interface User {
  id: string;
  name: string;
  avatar: string;
  gold: number;
  frame?: string;
  isHost?: boolean;
  privacy?: {
    showSocialList: boolean;
  };
}

export interface Message {
  id: string;
  userId: string;
  userName: string;
  content: string;
  type: 'text' | 'gift';
  giftName?: string;
  giftIcon?: string;
  reactions?: Record<string, number>;
}

export interface Room {
  id: string;
  title: string;
  country: string;
  host: User;
  users: User[];
  tags: string[];
}

export interface ChatContact {
  id: string;
  name: string;
  avatar: string;
  frame?: string;
  lastMessage: string;
  time: string;
  isAi?: boolean;
}
