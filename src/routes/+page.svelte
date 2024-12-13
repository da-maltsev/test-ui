<script lang="ts">
  import '../routes/styles.css';

  interface Message {
    id: number;
    text: string;
    timestamp: string;
  }

  let messages: Message[] = [
    {
      id: 1,
      text: "Welcome to the pixel message feed!",
      timestamp: new Date().toISOString()
    },
    {
      id: 2,
      text: "This is a retro-styled message board.",
      timestamp: new Date().toISOString()
    }
  ];
</script>

<main>
  <div class="message-feed">
    <header>
      ╔══════════════════════════╗
      <h1>PIXEL MESSAGE FEED</h1>
      ╚══════════════════════════╝
    </header>

    {#each messages as message (message.id)}
      <div class="message">
        <div class="message-text">{message.text}</div>
        <div class="message-timestamp">
          [{new Date(message.timestamp).toLocaleTimeString()}]
        </div>
      </div>
    {/each}
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

  .message-timestamp {
    font-size: 0.8rem;
    opacity: 0.7;
    margin-top: 0.5rem;
  }
</style> 