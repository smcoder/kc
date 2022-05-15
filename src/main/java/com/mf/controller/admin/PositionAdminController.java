package com.mf.controller.admin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mf.alg.SlotMatchAlgorithm;
import com.mf.entity.Goods;
import com.mf.entity.Log;
import com.mf.entity.Position;
import com.mf.service.*;
import com.mf.vo.HunterVO;
import com.mf.vo.PositionSelect;
import com.mf.vo.PositionTable;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台管理商品Controller
 *
 * @author Administrator
 */
@RestController
@RequestMapping("/admin/position")
public class PositionAdminController {

    @Resource
    private PositionService positionService;

    @Resource
    private LogService logService;

    @Resource
    private GoodsService goodsService;

    @Resource
    private AutoSelectPositionService autoSelectPositionService;

    /**
     * 分页查询商品信息
     *
     * @param position
     * @param page
     * @param rows
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    @RequiresPermissions(value = {"货位管理", "进货入库", "退货出库", "销售出库", "客户退货", "商品报损", "商品报溢"}, logical = Logical.OR)
    public Map<String, Object> list(Position position, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "rows", required = false) Integer rows) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        List<Position> positionList = positionService.list(position, page, rows, Direction.ASC, "id");
        Long total = positionService.getCount(position);
        resultMap.put("rows", positionList);
        resultMap.put("total", total);
        logService.save(new Log(Log.SEARCH_ACTION, "查询货位信息"));
        return resultMap;
    }

    @RequestMapping("/generate/{num}")
    @RequiresPermissions(value = {"货位管理"})
    public JSONArray generate(@PathVariable Integer num) {
        List<Goods> goodsList = goodsService.all(Integer.MAX_VALUE);
        String value = "[";
        for (int n = 1; n <= num; n++) {
            value += "{";
            for (int i = 1; i <= num; i++) {
                value += "'" + i;
                value += "':";
                if (n > 1) {
                    if (((n - 1) * num) + i >= goodsList.size()) {
                        value += "0,";
                    } else {
                        int pre = goodsList.get(i - 1).getInventoryQuantity();
                        double para = Math.sqrt(n * n + i * i) / 2;
                        int v = (int) (pre * para);
                        value += v + ",";
                    }
                } else {
                    if (n * i >= goodsList.size()) {
                        value += 0 + ",";
                    } else {
                        int pre = goodsList.get(i - 1).getInventoryQuantity();
                        double para = Math.sqrt(n * n + i * i) / 2;
                        int v = (int) (pre * para);
                        value += v + ",";

                    }
                }
            }
            value = value.substring(0, value.length() - 1);
            value += "},";
        }
        String refactor = value.substring(0, value.length() - 1);
        refactor += "]";
        return JSON.parseArray(refactor);
    }

    @RequestMapping("/calculate/{num}/{speed}")
    public HunterVO calculate(@PathVariable Integer num, @PathVariable Integer speed) {
        HunterVO hunterVO = new HunterVO();
        List<Goods> goodsList = goodsService.all(Integer.MAX_VALUE);
        SlotMatchAlgorithm.n = num;
        SlotMatchAlgorithm slotMatchAlgorithm = new SlotMatchAlgorithm(num);
        SlotMatchAlgorithm.initMatrix(goodsList);
        List<PositionSelect> list = autoSelectPositionService.autoSelect(speed);
        if (null != list && list.size() > 0) {
            hunterVO.setSum(list.stream().mapToInt(item -> item.getPositionIndex()).sum());
            int[][] matrix = new int[4][4];
            int[][] origin = SlotMatchAlgorithm.p;
            for (int i = 1; i <= num; ++i)
                for (int j = 1; j <= num; ++j)
                    if (origin[i - 1][j - 1] == -2) {
                        matrix[i - 1][j - 1] = 1;
                    } else {
                        matrix[i - 1][j - 1] = 0;
                    }
            hunterVO.setJsonArray(convert(matrix));
        }
        return hunterVO;
    }

    private JSONArray convert(int[][] matrix) {
        int num = matrix.length;
        String value = "[";
        for (int n = 1; n <= num; n++) {
            value += "{";
            for (int i = 1; i <= num; i++) {
                value += "'" + i;
                value += "':";
                value += matrix[n - 1][i - 1] + ",";
            }
            value = value.substring(0, value.length() - 1);
            value += "},";
        }
        String refactor = value.substring(0, value.length() - 1);
        refactor += "]";
        return JSON.parseArray(refactor);
    }


    /**
     * 添加或者修改货位信息
     *
     * @param position
     * @return
     * @throws Exception
     */
    @RequestMapping("/save")
    @RequiresPermissions(value = "货位管理")
    public Map<String, Object> save(Position position) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        if (position.getId() != null) {
            logService.save(new Log(Log.UPDATE_ACTION, "更新货位信息" + position));
        } else {
            logService.save(new Log(Log.ADD_ACTION, "添加货位信息" + position));
        }
        positionService.save(position);
        resultMap.put("success", true);
        return resultMap;
    }

    /**
     * 删除货位信息
     *
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    @RequiresPermissions(value = "货位管理")
    public Map<String, Object> delete(Integer id) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        Position position = positionService.findById(id);
        logService.save(new Log(Log.DELETE_ACTION, "删除货位信息" + position));
        positionService.delete(id);
        resultMap.put("success", true);
        return resultMap;
    }
}
