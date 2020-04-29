import axios from 'axios';
import { Whiskey } from './model';

export class WhiskeyWiseAPI {

  constructor(protected baseURL?: string) {
    if (!baseURL) this.baseURL = ''
  }

  async search(options?: SearchOptions): Promise<Whiskey[]> {
    const params: string[] = []
    if (options && options.contains) params.push(`contains=${options.contains.toLowerCase()}`)
    if (options && options.color) params.push(`color=${options.color}`)
    if (options && options.smokey) params.push(`smokey=${options.smokey}`)
    if (options && options.taste) params.push(`taste=${options.taste}`)
    const searchURL = `${this.baseURL}/search.json?${params.join('&')}`

    try {
      const response = await axios.get(searchURL)

      if (response.status !== 200) throw Error(`status ${response.status}: ${response.statusText}`)

      return response.data as Whiskey[]
    } catch (error) {
      throw Error(`Whiskeys search call failed: ${error}`)
    }
  }

  async deleteWhiskey(whiskeyId: number) {
    const deleteUrl = `${this.baseURL}/whiskeys/${whiskeyId}.json`

    try {
      const response = await axios.delete(deleteUrl)

      if (response.status !== 204) throw Error(`Delete whiskey returned ${response.status}: ${response.statusText}`)
    } catch (error) {
      throw Error(`Delete whiskey call failed: ${error}`)
    }
  }
}

type SearchOptions = {
  contains?: string
  taste?: number
  color?: number
  smokey?: number
}