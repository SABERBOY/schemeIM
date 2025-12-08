
import { UserProfile, Room as ApiRoom, Message as ApiMessage, ChatContact as ApiContact } from './api_schema';

export type Language = 'en' | 'ar';

// Re-exporting API types as App types for backward compatibility or extension
export interface User extends UserProfile {
  name: string; // Mapping displayName to name for legacy components
  avatar: string; // Mapping avatarUrl
  gold: number; // Mapping goldBalance
  frame?: string; // Mapping frameUrl
}

// Helper to convert API User to App User
export const toAppUser = (u: UserProfile): User => ({
  ...u,
  name: u.displayName,
  avatar: u.avatarUrl,
  gold: u.goldBalance,
  frame: u.frameUrl
});

// Helper to convert App User back to API User
export const toApiUser = (u: User): UserProfile => ({
  ...u,
  displayName: u.name,
  avatarUrl: u.avatar,
  goldBalance: u.gold,
  frameUrl: u.frame
});

export interface Room extends Omit<ApiRoom, 'host'> {
  country: string; // Mapped from countryFlag
  users: User[]; // Mapped from seats/audience
  host: User;
}

export interface Message extends ApiMessage {
  userId: string; // Mapped from senderId
  userName: string; // Mapped from senderName
  giftName?: string;
  giftIcon?: string;
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

export interface SharedProps {
  lang: Language;
  t: (key: string) => string;
}
