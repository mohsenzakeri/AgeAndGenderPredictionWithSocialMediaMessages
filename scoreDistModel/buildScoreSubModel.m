function [feat_mean,scoredUsers] = buildScoreSubModel(scores,usr_ss)
    usrids = usr_ss(:,1);
    usr = sort(unique(usrids));
    sorted_scores = sortrows(scores,-3);
    user_means = length(usr);
    for i=1:length(usr)
        ss_count = length(sorted_scores(sorted_scores(:,1)==usr(i),2));
        user_means(i) = mean(sorted_scores(sorted_scores(:,1)==usr(i),3));
        sorted_scores(sorted_scores(:,1)==usr(i),2) = [1:ss_count];
    end
    feat_mean = sparse((1:length(usr))',ones(length(usr),1),user_means');
    scoredUsers = sorted_scores;     
end