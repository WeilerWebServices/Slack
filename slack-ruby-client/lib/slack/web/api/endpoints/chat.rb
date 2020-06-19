# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Chat
          #
          # Execute a slash command in a public channel (undocumented)
          #
          # @option options [channel] :channel
          #   Channel to execute the command in.
          # @option options [Object] :command
          #   Slash command to be executed. Leading backslash is required.
          # @option options [Object] :text
          #   Additional parameters provided to the slash command.
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/undocumented/chat/chat.command.json
          def chat_command(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :command missing') if options[:command].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            logger.warn('The chat.command method is undocumented.')
            post('chat.command', options)
          end

          #
          # Deletes a message.
          #
          # @option options [channel] :channel
          #   Channel containing the message to be deleted.
          # @option options [timestamp] :ts
          #   Timestamp of the message to be deleted.
          # @option options [Object] :as_user
          #   Pass true to delete the message as the authed user with chat:write:user scope. Bot users in this context are considered authed users. If unused or false, the message will be deleted with chat:write:bot scope.
          # @see https://api.slack.com/methods/chat.delete
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/chat/chat.delete.json
          def chat_delete(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :ts missing') if options[:ts].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('chat.delete', options)
          end

          #
          # Deletes a pending scheduled message from the queue.
          #
          # @option options [channel] :channel
          #   The channel the scheduled_message is posting to.
          # @option options [Object] :scheduled_message_id
          #   scheduled_message_id returned from call to chat.scheduleMessage.
          # @option options [Object] :as_user
          #   Pass true to delete the message as the authed user with chat:write:user scope. Bot users in this context are considered authed users. If unused or false, the message will be deleted with chat:write:bot scope.
          # @see https://api.slack.com/methods/chat.deleteScheduledMessage
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/chat/chat.deleteScheduledMessage.json
          def chat_deleteScheduledMessage(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :scheduled_message_id missing') if options[:scheduled_message_id].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('chat.deleteScheduledMessage', options)
          end

          #
          # Retrieve a permalink URL for a specific extant message
          #
          # @option options [channel] :channel
          #   The ID of the conversation or channel containing the message.
          # @option options [Object] :message_ts
          #   A message's ts value, uniquely identifying it within a channel.
          # @see https://api.slack.com/methods/chat.getPermalink
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/chat/chat.getPermalink.json
          def chat_getPermalink(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :message_ts missing') if options[:message_ts].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('chat.getPermalink', options)
          end

          #
          # Share a me message into a channel.
          #
          # @option options [channel] :channel
          #   Channel to send message to. Can be a public channel, private group or IM channel. Can be an encoded ID, or a name.
          # @option options [Object] :text
          #   Text of the message to send.
          # @see https://api.slack.com/methods/chat.meMessage
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/chat/chat.meMessage.json
          def chat_meMessage(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :text missing') if options[:text].nil?
            post('chat.meMessage', options)
          end

          #
          # Sends an ephemeral message to a user in a channel.
          #
          # @option options [Object] :attachments
          #   A JSON-based array of structured attachments, presented as a URL-encoded string.
          # @option options [channel] :channel
          #   Channel, private group, or IM channel to send message to. Can be an encoded ID, or a name.
          # @option options [Object] :text
          #   Text of the message to send. See below for an explanation of formatting. This field is usually required, unless you're providing only attachments instead.
          # @option options [user] :user
          #   id of the user who will receive the ephemeral message. The user should be in the channel specified by the channel argument.
          # @option options [Object] :as_user
          #   Pass true to post the message as the authed user. Defaults to true if the chat:write:bot scope is not included. Otherwise, defaults to false.
          # @option options [Object] :blocks
          #   A JSON-based array of structured blocks, presented as a URL-encoded string.
          # @option options [Object] :icon_emoji
          #   Emoji to use as the icon for this message. Overrides icon_url. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
          # @option options [Object] :icon_url
          #   URL to an image to use as the icon for this message. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
          # @option options [Object] :link_names
          #   Find and link channel names and usernames.
          # @option options [Object] :parse
          #   Change how messages are treated. Defaults to none. See below.
          # @option options [Object] :thread_ts
          #   Provide another message's ts value to post this message in a thread. Avoid using a reply's ts value; use its parent's value instead. Ephemeral messages in threads are only shown if there is already an active thread.
          # @option options [Object] :username
          #   Set your bot's user name. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
          # @see https://api.slack.com/methods/chat.postEphemeral
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/chat/chat.postEphemeral.json
          def chat_postEphemeral(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :text, :attachments or :blocks missing') if options[:text].nil? && options[:attachments].nil? && options[:blocks].nil?
            throw ArgumentError.new('Required arguments :user missing') if options[:user].nil?
            options = options.merge(user: users_id(options)['user']['id']) if options[:user]
            # attachments must be passed as an encoded JSON string
            if options.key?(:attachments)
              attachments = options[:attachments]
              attachments = JSON.dump(attachments) unless attachments.is_a?(String)
              options = options.merge(attachments: attachments)
            end
            # blocks must be passed as an encoded JSON string
            if options.key?(:blocks)
              blocks = options[:blocks]
              blocks = JSON.dump(blocks) unless blocks.is_a?(String)
              options = options.merge(blocks: blocks)
            end
            post('chat.postEphemeral', options)
          end

          #
          # Sends a message to a channel.
          #
          # @option options [channel] :channel
          #   Channel, private group, or IM channel to send message to. Can be an encoded ID, or a name. See below for more details.
          # @option options [Object] :text
          #   Text of the message to send. See below for an explanation of formatting. This field is usually required, unless you're providing only attachments instead. Provide no more than 40,000 characters or risk truncation.
          # @option options [Object] :as_user
          #   Pass true to post the message as the authed user, instead of as a bot. Defaults to false. See authorship below.
          # @option options [Object] :attachments
          #   A JSON-based array of structured attachments, presented as a URL-encoded string.
          # @option options [Object] :blocks
          #   A JSON-based array of structured blocks, presented as a URL-encoded string.
          # @option options [Object] :icon_emoji
          #   Emoji to use as the icon for this message. Overrides icon_url. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
          # @option options [Object] :icon_url
          #   URL to an image to use as the icon for this message. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
          # @option options [Object] :link_names
          #   Find and link channel names and usernames.
          # @option options [Object] :mrkdwn
          #   Disable Slack markup parsing by setting to false. Enabled by default.
          # @option options [Object] :parse
          #   Change how messages are treated. Defaults to none. See below.
          # @option options [Object] :reply_broadcast
          #   Used in conjunction with thread_ts and indicates whether reply should be made visible to everyone in the channel or conversation. Defaults to false.
          # @option options [Object] :thread_ts
          #   Provide another message's ts value to make this message a reply. Avoid using a reply's ts value; use its parent instead.
          # @option options [Object] :unfurl_links
          #   Pass true to enable unfurling of primarily text-based content.
          # @option options [Object] :unfurl_media
          #   Pass false to disable unfurling of media content.
          # @option options [Object] :username
          #   Set your bot's user name. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
          # @see https://api.slack.com/methods/chat.postMessage
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/chat/chat.postMessage.json
          def chat_postMessage(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :text, :attachments or :blocks missing') if options[:text].nil? && options[:attachments].nil? && options[:blocks].nil?
            # attachments must be passed as an encoded JSON string
            if options.key?(:attachments)
              attachments = options[:attachments]
              attachments = JSON.dump(attachments) unless attachments.is_a?(String)
              options = options.merge(attachments: attachments)
            end
            # blocks must be passed as an encoded JSON string
            if options.key?(:blocks)
              blocks = options[:blocks]
              blocks = JSON.dump(blocks) unless blocks.is_a?(String)
              options = options.merge(blocks: blocks)
            end
            post('chat.postMessage', options)
          end

          #
          # Schedules a message to be sent to a channel.
          #
          # @option options [channel] :channel
          #   Channel, private group, or DM channel to send message to. Can be an encoded ID, or a name. See below for more details.
          # @option options [Object] :post_at
          #   Unix EPOCH timestamp of time in future to send the message.
          # @option options [Object] :text
          #   Text of the message to send. See below for an explanation of formatting. This field is usually required, unless you're providing only attachments instead. Provide no more than 40,000 characters or risk truncation.
          # @option options [Object] :as_user
          #   Pass true to post the message as the authed user, instead of as a bot. Defaults to false. See authorship below.
          # @option options [Object] :attachments
          #   A JSON-based array of structured attachments, presented as a URL-encoded string.
          # @option options [Object] :blocks
          #   A JSON-based array of structured blocks, presented as a URL-encoded string.
          # @option options [Object] :link_names
          #   Find and link channel names and usernames.
          # @option options [Object] :parse
          #   Change how messages are treated. Defaults to none. See below.
          # @option options [Object] :reply_broadcast
          #   Used in conjunction with thread_ts and indicates whether reply should be made visible to everyone in the channel or conversation. Defaults to false.
          # @option options [Object] :thread_ts
          #   Provide another message's ts value to make this message a reply. Avoid using a reply's ts value; use its parent instead.
          # @option options [Object] :unfurl_links
          #   Pass true to enable unfurling of primarily text-based content.
          # @option options [Object] :unfurl_media
          #   Pass false to disable unfurling of media content.
          # @see https://api.slack.com/methods/chat.scheduleMessage
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/chat/chat.scheduleMessage.json
          def chat_scheduleMessage(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :post_at missing') if options[:post_at].nil?
            throw ArgumentError.new('Required arguments :text missing') if options[:text].nil?
            post('chat.scheduleMessage', options)
          end

          #
          # Provide custom unfurl behavior for user-posted URLs
          #
          # @option options [channel] :channel
          #   Channel ID of the message.
          # @option options [timestamp] :ts
          #   Timestamp of the message to add unfurl behavior to.
          # @option options [Object] :unfurls
          #   URL-encoded JSON map with keys set to URLs featured in the the message, pointing to their unfurl blocks or message attachments.
          # @option options [Object] :user_auth_message
          #   Provide a simply-formatted string to send as an ephemeral message to the user as invitation to authenticate further and enable full unfurling behavior.
          # @option options [Object] :user_auth_required
          #   Set to true or 1 to indicate the user must install your Slack app to trigger unfurls for this domain.
          # @option options [Object] :user_auth_url
          #   Send users to this custom URL where they will complete authentication in your app to fully trigger unfurling. Value should be properly URL-encoded.
          # @see https://api.slack.com/methods/chat.unfurl
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/chat/chat.unfurl.json
          def chat_unfurl(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :ts missing') if options[:ts].nil?
            throw ArgumentError.new('Required arguments :unfurls missing') if options[:unfurls].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('chat.unfurl', options)
          end

          #
          # Updates a message.
          #
          # @option options [channel] :channel
          #   Channel containing the message to be updated.
          # @option options [Object] :text
          #   New text for the message, using the default formatting rules. It's not required when presenting attachments.
          # @option options [timestamp] :ts
          #   Timestamp of the message to be updated.
          # @option options [Object] :as_user
          #   Pass true to update the message as the authed user. Bot users in this context are considered authed users.
          # @option options [Object] :attachments
          #   A JSON-based array of structured attachments, presented as a URL-encoded string. This field is required when not presenting text.
          # @option options [Object] :blocks
          #   A JSON-based array of structured blocks, presented as a URL-encoded string.
          # @option options [Object] :link_names
          #   Find and link channel names and usernames. Defaults to none. See below.
          # @option options [Object] :parse
          #   Change how messages are treated. Defaults to client, unlike chat.postMessage. See below.
          # @see https://api.slack.com/methods/chat.update
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/chat/chat.update.json
          def chat_update(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :text, :attachments or :blocks missing') if options[:text].nil? && options[:attachments].nil? && options[:blocks].nil?
            throw ArgumentError.new('Required arguments :ts missing') if options[:ts].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            # attachments must be passed as an encoded JSON string
            if options.key?(:attachments)
              attachments = options[:attachments]
              attachments = JSON.dump(attachments) unless attachments.is_a?(String)
              options = options.merge(attachments: attachments)
            end
            # blocks must be passed as an encoded JSON string
            if options.key?(:blocks)
              blocks = options[:blocks]
              blocks = JSON.dump(blocks) unless blocks.is_a?(String)
              options = options.merge(blocks: blocks)
            end
            post('chat.update', options)
          end
        end
      end
    end
  end
end
