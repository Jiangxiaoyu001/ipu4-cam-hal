#!/bin/bash
#
#  GStreamer
#  Copyright (C) 2016 Intel Corporation
#
#  Permission is hereby granted, free of charge, to any person obtaining a
#  copy of this software and associated documentation files (the "Software"),
#  to deal in the Software without restriction, including without limitation
#  the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  and/or sell copies of the Software, and to permit persons to whom the
#  Software is furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  DEALINGS IN THE SOFTWARE.
#
#  Alternatively, the contents of this file may be used under the
#  GNU Lesser General Public License Version 2.1 (the "LGPL"), in
#  which case the following provisions apply instead of the ones
#  mentioned above:
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Library General Public
#  License as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Library General Public License for more details.
#
#  You should have received a copy of the GNU Library General Public
#  License along with this library; if not, write to the
#  Free Software Foundation, Inc., 59 Temple Place - Suite 330,
#  Boston, MA 02111-1307, USA.
#

function uyvy_vaapisink_preview_fps_progressive() {
    LOGI "UYVY 1080p";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_progressive_1920_1080_fps | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_1080p_4lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY 720p";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_progressive_1280_720_fps | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_720p_4lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY 576p";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_progressive_720_576_fps | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_576p_2lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY 640x480";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_progressive_640_480_fps | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_vga_2lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

}

function uyvy_vaapisink_preview_fps_interlace() {
    LOGI "UYVY 1080i";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_interlace_1920_1080_fps | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_1080i_2lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY 576i";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_interlace_720_576_fps | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_576i_2lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY 480i";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_interlace_720_480_fps | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_480i_2lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait
}

function uyvy_vaapisink_preview_import_dma() {
    LOGI "UYVY dma import 1080p";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_dma_import_progressive_1920_1080 | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_1080p_4lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY dma import 720p";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_dma_import_progressive_1280_720 | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_720p_4lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY dma import 576p";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_dma_import_progressive_720_576 | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_576p_2lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY dma import 640x480";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_dma_import_progressive_640_480 | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_vga_2lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait
}

function uyvy_vaapisink_preview_export_dma() {
    LOGI "UYVY dma export 1080p";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_dma_export_progressive_1920_1080 | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_1080p_4lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY dma export 720p";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_dma_export_progressive_1280_720 | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_720p_4lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY dma export 576p";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_dma_export_progressive_720_576 | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_576p_2lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait

    sleep 2

    LOGI "UYVY dma export 640x480";LOGN
    EXECUTE unbuffer Script.gst_launch_preview_icamerasrc_UYVY_vaapisink_dma_export_progressive_640_480 | awk -F ':' '{if (match($0, /automation checkpoint: flag: poll_started/)) {system("echo yuv422_vga_2lane.py>/dev/udp/'${xrc_ip}'/13579")}}'
    wait
}
uyvy_vaapisink_preview_fps_progressive
uyvy_vaapisink_preview_fps_interlace
uyvy_vaapisink_preview_import_dma
uyvy_vaapisink_preview_export_dma
