/*
 * INTEL CONFIDENTIAL
 * Copyright (c) 2017-2018 Intel Corporation. All Rights Reserved.
 *
 * The source code contained or described herein and all documents related to
 * the source code ("Material") are owned by Intel Corporation or its suppliers
 * or licensors. Title to the Material remains with Intel Corporation or its
 * suppliers and licensors. The Material contains trade secrets and proprietary
 * and confidential information of Intel or its suppliers and licensors. The
 * Material is protected by worldwide copyright and trade secret laws and
 * treaty provisions. No part of the Material may be used, copied, reproduced,
 * modified, published, uploaded, posted, transmitted, distributed, or
 * disclosed in any way without Intel's prior express written permission.
 *
 * No license under any patent, copyright, trade secret or other intellectual
 * property right is granted to or conferred upon you by disclosure or delivery
 * of the Materials, either expressly, by implication, inducement, estoppel or
 * otherwise. Any license under such intellectual property rights must be
 * express and approved by Intel in writing.
 */

#ifndef IA_CAMERA_PROCESSING_PIPELINE_IPU_PIPE_CONTROLLER_H_
#define IA_CAMERA_PROCESSING_PIPELINE_IPU_PIPE_CONTROLLER_H_

#include "i_imaging_pipe_controller.h"
extern "C" {
#include <imaging_pipe_controller.h>
}

class IpuPipeController : public IImagingPipeController {
public:
    IpuPipeController();
    virtual ~IpuPipeController() {}

    virtual css_err_t addBuffer(ia_cipf_buffer_t *buffer);

    virtual css_err_t registerBuffer(ia_cipf_buffer_t *buffer);

    virtual css_err_t configureStage(ia_uid stageUid,
                                     ia_cipf_iterator_t *iterator,
                                     const ia_binary_data *ipuParameters);

    virtual css_err_t configureStage(ia_uid stage_uid,
                                     ia_cipf_iterator_t *iterator,
                                     ia_cipf_buffer_t *ipuParameters);

    virtual css_err_t configureStages(ia_cipf_iterator_t *iterator,
                                      const ia_binary_data *ipuParameters);

    virtual css_err_t configureStages(ia_cipf_iterator_t *iterator,
                                      ia_cipf_buffer_t *ipuParameters);

    virtual css_err_t decodeStatistics(ia_cipf_iterator_t *iterator,
                                       ia_uid stageUid,
                                       ia_binary_data *statistics);

    virtual void destroy();

    virtual css_err_t identifyProperty(ia_cipf_property_t *property);

    virtual css_err_t identifyStage(ia_uid stage_uid,
                                    int *status);

    virtual css_err_t init(ia_cipf_pipe_t *pipe);

    virtual css_err_t prepareStage(ia_uid stage_uid,
                                   const ia_binary_data *ipuParameters);
    virtual css_err_t prepareStage(ia_uid stage_uid,
                                   ia_cipf_buffer_t *ipuParameters);
private:
    imaging_pipe_ctrl_t *mImagingPipeController;
};

#endif /* IA_CAMERA_PROCESSING_PIPELINE_IPU_PIPE_CONTROLLER_H_ */
