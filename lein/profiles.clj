{:system {:mirrors {"central" {:name "central"
                               :url "https://maven.aliyun.com/nexus/content/groups/public/"}
                    #"clojars" {:name "Clojar Mirror"
                                :url "https://mirrors.tuna.tsinghua.edu.cn/clojars"
                                :repo-manager true}}}
 :user {:plugins [[lein-pprint "1.3.2"]
                  [lein-ancient "0.6.15"]
                  [lein-cljfmt "0.6.7"]
                  [lein-bikeshed "0.5.2"]
                  [lein-kibit "0.1.8"]
                  [jonase/eastwood "0.3.11"]
                  [lein-try "0.4.3"]
                  [docstring-checker "1.1.0"]
                  [lein-checkall "0.1.1"]
                  [lein-annotations "0.2.0"]]}}
