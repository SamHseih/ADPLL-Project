# 總覽

整體架構如下圖所示：
<img width="1073" height="452" alt="image" src="https://github.com/user-attachments/assets/8f3307d7-dd73-4723-8861-0fdfec6e7b00" />

- **Controller**：包含 DCO 與 Loop Filter。
- **DCO（Digitally Controlled Oscillator）**：
  - 採二進制控制架構，共使用 6 條 Coarse 線控制多組 Buffer Bank。
  - 每條線控制 2ⁿ 台 Buffer（`Coarse_0` 控制 1 台，`Coarse_6` 控制 64 台）。
  - 採「三行並聯」架構，提升穩定性與線性度。
- **Loop Filter**：
  - 由 `ANCHOR_reg`、`up_counter`、`down_counter` 組成。
  - 當 `freq_lock` 時，將 `dco_code` 寫入 `ANCHOR_reg`。
  - 當連續 4 次同方向計數，更新 `ANCHOR_reg`（++ 或 --）。
  - 當偵測到 `polarity` 改變時，更新 `dco_code`。
- **Monitor**：輸入 REF_CLK、M、Reset 等控制信號。
- **Divider**：計數式除頻器。
- **PFD（Phase Frequency Detector）**：相位頻率偵測器。

## Function Behavior 波型圖展示：
<img width="1136" height="212" alt="image" src="https://github.com/user-attachments/assets/7f6a9cef-8cc2-48db-ac5c-04217ce6dfdd" />

## 混合訊號波型(DCO、PFD為Analog，其餘為Digital)展示：
<img width="1203" height="315" alt="image" src="https://github.com/user-attachments/assets/0fb90241-b521-4aeb-92e1-2bd1f54948c1" />

- 其中擷取某段放大後，Phase_clk 為 REF_CLK。
<img width="1149" height="221" alt="image" src="https://github.com/user-attachments/assets/7fe5ab6c-d175-497b-8a70-94e50b9b80f0" />
