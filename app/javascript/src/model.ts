export interface Whiskey {
  id: number
  user_id: number
  name: string
  description: string
  rate_taste: number
  rate_color: number
  rate_smokey: number
  created_at: string
  updated_at: string
  url: string
}

export interface User {
  id: number
  name: string
}