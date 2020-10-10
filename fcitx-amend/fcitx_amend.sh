#!/usr/bin/env bash
# **********************************************************************
# * Description   : monitor fcitx cpu usage
# * Last change   : 19:05:33 2020-10-10
# * Author        : Yihao Chen
# * Email         : chenyiha17@mails.tsinghua.edu.cn
# * License       : www.opensource.org/licenses/bsd-license.php
# **********************************************************************

PROCESS="fcitx"
CHECK_INTV=5

get_pid()
{
    PID=""
    while [ ! $PID ]; do
        PID=$(pidof $1)
        sleep 1
    done
    echo $PID
}

get_consume_cpu()
{
    echo $(top -b -p $1 -n 1 | tail -n 1 | awk '{print $9}')
}

PID=$(get_pid $PROCESS)
# echo $PID

while [[ 1 ]]; do
    if [[ $(get_consume_cpu $PID) > 10.0 ]]; then
        count=4
        while [[ $count > 0 ]]; do
            sleep 1
            count=$(($count-1))
            if [[ $(get_consume_cpu $PID) < 10.0 ]]; then
                break
            elif [[ $count = 0 ]]; then
                kill $PID
                PID=$(get_pid $PROCESS)
            fi
        done
    fi
    sleep $CHECK_INTV
    # echo "check"
done
