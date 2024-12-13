<script lang="ts">
  import { onMount } from 'svelte';
  import '../routes/styles.css';

  interface Message {
    id: number;
    title: string;
    text: string;
    created: string;  // ISO datetime string
  }

  let messages: Message[] = [];
  let error: string | null = null;
  let loading = true;

  async function fetchMessages() {
    try {
      const response = await fetch('/api/messages');
      if (!response.ok) {
        messages = [];
        return;
      }
      messages = await response.json();
    } catch (e) {
      messages = [];
    } finally {
      loading = false;
    }
  }

  onMount(() => {
    fetchMessages();
  });
</script>

<main>
  <div class="message-feed">
    <header>
      ╔══════════════════════════╗
      <h1>PIXEL MESSAGE FEED</h1>
      ╚══════════════════════════╝
    </header>

    {#if loading}
      <div class="status-message">
        Loading messages...
      </div>
    {:else if messages.length === 0}
      <div class="status-message">
        No messages found
      </div>
    {:else}
      {#each messages as message (message.id)}
          <div class="message-title">{message.title}</div>
          <div class="message-text">{message.text}</div>
          <div class="message-timestamp">
            [{new Date(message.created).toLocaleString()}]
          </div>
      {/each}
    {/if}
  </div>
</main>

<style>
  header {
    text-align: center;
    margin-bottom: 2rem;
    white-space: pre;
  }

  h1 {
    font-size: 1.5rem;
    margin: 1rem 0;
  }

  .message-title {
    font-weight: bold;
    margin-bottom: 0.5rem;
    color: #66ff66;
  }

  .message-timestamp {
    font-size: 0.8rem;
    opacity: 0.7;
    margin-top: 0.5rem;
  }

  .status-message {
    text-align: center;
    padding: 1rem;
    border: 1px dashed var(--border-color);
  }

  .status-message.error {
    border-color: #ff3333;
    color: #ff3333;
  }
</style> 