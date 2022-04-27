//Редактирование Измерительного Прибора
unit EditENMeasurDevice;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons, EnergyproController,
  EnergyproController2, ENMeasurDeviceController;

type
  TfrmENMeasurDeviceEdit = class(TDialogForm)
  
    lblCode : TLabel;
	  edtCode : TEdit;
    lblDispName: TLabel;
    edtDispName: TEdit;
    lblWorkNumber : TLabel;
    edtWorkNumber: TEdit;
    lblENScaleName: TLabel;
    edtENScaleName: TEdit;
    spbENScale: TSpeedButton;
    spbENBranch: TSpeedButton;
    lblENHighVoltageSellName: TLabel;
    edtENHighVoltageSellName: TEdit;
    spbENHighVoltageSell: TSpeedButton;
    HTTPRIOENMeasurDevice: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblBranch: TLabel;
    lblENMeasurDeviceType: TLabel;
    edtENMeasurDeviceType: TEdit;
    spbENMeasurDeviceType: TSpeedButton;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    HTTPRIOENLowVoltBoard: THTTPRIO;
    lblTransformer: TLabel;
    memTransformer: TMemo;
    HTTPRIOENTransformer: THTTPRIO;
    HTTPRIOENPanel: THTTPRIO;
    HTTPRIOENBranch: THTTPRIO;
    memENBranchName: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENScaleClick(Sender : TObject);
    procedure spbENBranchClick(Sender : TObject);
    procedure spbENHighVoltageSellClick(Sender : TObject);
    procedure spbENMeasurDeviceTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codeS04, elementCodeS04: Integer;
end;

var frmENMeasurDeviceEdit: TfrmENMeasurDeviceEdit;
  ENMeasurDeviceObj: ENMeasurDevice;

implementation

uses
  EditENSubstation04, ShowENScale, ENScaleController, ShowENBranch,
  ENBranchController, ShowENHighVoltageSell, ENHighVoltageSellController,
  ShowENMeasurDeviceType, ENMeasurDeviceTypeController, ShowTKMaterials,
  TKMaterialsController, ENLowVoltBoardController, ShowENLowVoltBoard,
  ENPanelController, ENTransformerController, Main, ShowENPanel, ENConsts;

{$R *.dfm}

procedure TfrmENMeasurDeviceEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  ENLowVoltBoardObj: ENLowVoltBoard;
  TempENBranch: ENBranchControllerSoapPort;
  ENBranchObj: ENBranch;
  TempENTransformer: ENTransformerControllerSoapPort; trObj: ENTransformer;
  TempENPanel: ENPanelControllerSoapPort; pnlObj: ENPanel;
begin
  DisableControls( [edtENHighVoltageSellName, memENBranchName, edtENScaleName,
    edtMaterialsName, edtENMeasurDeviceType, memTransformer]);
  if DialogState = dsView then
    DisableControls([spbENScale, spbENBranch, spbENHighVoltageSell,
      spbENBranch, spbTkMaterials]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    begin
      DisableControls([spbENBranch], lblBranch.Caption <> 'Расположение на щите');
      DenyBlankValues([edtMaterialsName]);
    end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENMeasurDeviceObj.code);

      edtDispName.Text := ENMeasurDeviceObj.name;

      if ENMeasurDeviceObj.measurDeviceType <> nil then
        edtENMeasurDeviceType.Text := ENMeasurDeviceObj.measurDeviceType.name
      else
        edtENMeasurDeviceType.Text := '';

      edtWorkNumber.Text := ENMeasurDeviceObj.workNumber;

      if ENMeasurDeviceObj.scale <> nil then
        edtENScaleName.Text := ENMeasurDeviceObj.scale.name;

      case deviceParty of //Место оборудования на подстанции
        partyHVS: //Высоковольтная сторона, ячейка
          if ENMeasurDeviceObj.highvoltageSell <> nil then
            begin
              edtENHighVoltageSellName.Text := 'Ячейка № ' +
                ENMeasurDeviceObj.highvoltageSell.numberGen;

              if ENMeasurDeviceObj.highVoltageSell.transformerRef <> nil then
                if ENMeasurDeviceObj.highVoltageSell.transformerRef.code <>
                  low(Integer)
                then
                  begin
                    TempENTransformer := HTTPRIOENTransformer
                      as ENTransformerControllerSoapPort;
                    trObj := TempENTransformer.getObject(
                      ENMeasurDeviceObj.highVoltageSell.code);
                    try
                      memTransformer.Text := trObj.name;
                      if trObj.nominalPower <> nil then
                        if trObj.nominalPower.DecimalString <> '' then
                          memTransformer.Text := memTransformer.Text +
                            ', P = ' + trObj.nominalPower.DecimalString
                            + ' кВА';
                          if trObj.invNumber <> '' then
                            memTransformer.Text := memTransformer.Text +
                            ', Інв. № ' + trObj.invNumber;
                    finally
                      ENMeasurDeviceObj.Free;
                      ENMeasurDeviceObj := nil;
                    end;
                  end; //if ENMeasurDeviceObj.highVoltageSell.transformerRef.code...
            end; //if ENMeasurDeviceObj.highvoltageSell <> nil then
        partyLVBM: //Низковольтная сторона, главная шина низковольтного щита
          begin
            if ENMeasurDeviceObj.lvbRef <> nil then
              begin
                lblBranch.Caption := 'Расположение на щите';
                TempENLowVoltBoard :=
                  HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                ENLowVoltBoardObj := TempENLowVoltBoard.getObject(ENMeasurDeviceObj.lvbRef.code);
                if ENLowVoltBoardObj <> nil then
                  if ENLowVoltBoardObj.code <> low(Integer) then
                    begin
                      memENBranchName.Text := ENLowVoltBoardObj.name;
                      if ENLowVoltBoardObj.transformerRef <> nil then
                        if ENLowVoltBoardObj.transformerRef.code <> low(Integer)
                        then
                          begin
                            TempENTransformer := HTTPRIOENTransformer
                              as ENTransformerControllerSoapPort;
                            trObj := TempENTransformer.getObject(
                              ENLowVoltBoardObj.transformerRef.code);
                            try
                              memTransformer.Text := trObj.name;
                              if trObj.nominalPower <> nil then
                                if trObj.nominalPower.DecimalString <> '' then
                                  memTransformer.Text := memTransformer.Text +
                                    ', P = ' + trObj.nominalPower.DecimalString
                                    + ' кВА';
                                  if trObj.invNumber <> '' then
                                    memTransformer.Text := memTransformer.Text +
                                    ', Інв. № ' + trObj.invNumber;
                            finally
                              trObj.Free;
                              trObj := nil;
                            end;
                          end //if ENLowVoltBoardObj.transformerRef.code <> ...
                    end; //if ENLowVoltBoardObj.code <> low(Integer) then
              end; //if ENMeasurDeviceObj.lvbRef <> nil then
            if ENMeasurDeviceObj.panel <> nil then
              if ENMeasurDeviceObj.panel.code <> low(Integer) then
                begin
                  TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
                  pnlObj := TempENPanel.getObject(ENMeasurDeviceObj.panel.code);
                  try
                    if memENBranchName.Text <> '' then
                      memENBranchName.Text := memENBranchName.Text + '. ';
                    memENBranchName.Text := memENBranchName.Text + pnlObj.name;
                    if pnlObj.panelType <> nil then
                      if pnlObj.panelType.code <> low(Integer) then
                        if pnlObj.panelType.code <> ENPNL_NOTDEFINED then
                          memENBranchName.Text := memENBranchName.Text + '. ' +
                            pnlObj.panelType.name;
                  finally
                    pnlObj.Free;
                    pnlObj := nil;
                  end;
                end; //if ENMeasurDeviceObj.panel.code <> low(Integer) then
          end;
        partyLVBP: //Низковольтная сторона, присоединение на панели низковольтного щита
          if ENMeasurDeviceObj.branch <> nil then
            if ENMeasurDeviceObj.branch.code <> low(Integer) then
              begin
                lblBranch.Caption := 'Отходящая линия';
                memENBranchName.Text := ENMeasurDeviceObj.branch.name;
                TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
                ENBranchObj :=
                  TempENBranch.getObject(ENMeasurDeviceObj.branch.code);
                try
                  if ENBranchObj.panel <> nil then
                    if ENBranchObj.panel.code <> low(Integer) then
                      begin
                        TempENPanel :=
                          HTTPRIOENPanel as ENPanelControllerSoapPort;
                        pnlObj := TempENPanel.getObject(ENBranchObj.panel.code);
                        try
                          if pnlObj.transformer <> nil then
                            if pnlObj.transformer.code <> low(Integer) then
                              begin
                                TempENTransformer := HTTPRIOENTransformer as
                                  ENTransformerControllerSoapPort;
                                trObj := TempENTransformer.getObject(
                                  pnlObj.transformer.code);
                                try
                                  memTransformer.Text := trObj.name;
                                  if trObj.nominalPower <> nil then
                                    if trObj.nominalPower.DecimalString <> ''
                                    then
                                      memTransformer.Text := memTransformer.Text
                                        + ', P = '
                                        + trObj.nominalPower.DecimalString
                                        + ' кВА';
                                      if trObj.invNumber <> '' then
                                        memTransformer.Text :=
                                          memTransformer.Text + ', Інв. № '
                                          + trObj.invNumber;
                                finally
                                  trObj.Free;
                                  trObj := nil;
                                end;
                              end; //if pnlObj.transformer <> nil then
                        finally
                          pnlObj.Free;
                          pnlObj := nil;
                        end;
                      end; //if ENBranchObj.panel.code <> low(Integer) then
                finally
                  ENBranchObj.Free;
                  ENBranchObj := nil;
                end;
              end; //if ENMeasurDeviceObj.branch.code <> low(Integer) then
      end; // case deviceParty of

      if ENMeasurDeviceObj.materialRef <> nil then
        if ENMeasurDeviceObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENMeasurDeviceObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

    end;
end;

procedure TfrmENMeasurDeviceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtWorkNumber, edtMaterialsName])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENMeasurDevice := HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;


     ENMeasurDeviceObj.name := edtDispName.Text;

     ENMeasurDeviceObj.workNumber := edtWorkNumber.Text; 

    if DialogState = dsInsert then
    begin
      ENMeasurDeviceObj.code:=low(Integer);
      TempENMeasurDevice.add(ENMeasurDeviceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMeasurDevice.save(ENMeasurDeviceObj);
    end;
  end;
end;


procedure TfrmENMeasurDeviceEdit.spbENScaleClick(Sender : TObject);
var 
   frmENScaleShow: TfrmENScaleShow;
begin
   frmENScaleShow:=TfrmENScaleShow.Create(Application,fmNormal);
   try
      with frmENScaleShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMeasurDeviceObj.scale = nil then ENMeasurDeviceObj.scale := ENScale.Create();
               ENMeasurDeviceObj.scale.code := StrToInt(GetReturnValue(sgENScale,0));
               edtENScaleName.Text:=GetReturnValue(sgENScale,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENScaleShow.Free;
   end;
end;

procedure TfrmENMeasurDeviceEdit.spbENBranchClick(Sender : TObject);
var frmENBranchShow: TfrmENBranchShow;
  ENBranchFilterObj: ENBranchFilter;
  ENLowVoltBoardFilterObj: ENLowVoltBoardFilter;
  ENPanelFilterObj: ENPanelFilter;
  isLVBnil: Boolean;
  TempENPanel: ENPanelControllerSoapPort;
  ENPanelObj: ENPanel;
begin
  if lblBranch.Caption = 'Отходящая линия' then
    begin

      ENBranchFilterObj := ENBranchFilter.Create;
      SetNullIntProps(ENBranchFilterObj);
      SetNullXSProps(ENBranchFilterObj);
      if ENSubstation04Obj <> nil then
       if ENSubstation04Obj.element <> nil then
         if ENSubstation04Obj.element.code <> Low(Integer) then
           ENBranchFilterObj.conditionSQL :=
               ' ENBRANCH.LINE04REFCODE IN ' + #13#10
             + '   (SELECT CODE FROM  ENLINE04 WHERE ELEMENTCODE IN ' + #13#10
             + '     (SELECT CODE FROM ENELEMENT WHERE ELEMENTINREFCODE = '
             +  IntToStr(ENSubstation04Obj.element.code) + '))'
             + ' OR ENBRANCH.LINECABLEREFCODE IN ' + #13#10
             + '   (SELECT CODE FROM  ENLINE04 WHERE ELEMENTCODE IN ' + #13#10
             + '     (SELECT CODE FROM ENELEMENT WHERE ELEMENTINREFCODE = '
             +  IntToStr(ENSubstation04Obj.element.code) + '))'
             ;
      frmENBranchShow :=
        TfrmENBranchShow.Create(Application, fmNormal, ENBranchFilterObj);
      try
        with frmENBranchShow do
          if ShowModal = mrOk then
            begin
              try
                if ENMeasurDeviceObj.branch = nil then
                  ENMeasurDeviceObj.branch := ENBranch.Create();
                ENMeasurDeviceObj.branch.code :=
                  StrToInt(GetReturnValue(sgENBranch,0));
                memENBranchName.Text := GetReturnValue(sgENBranch, 1);
              except
                on EConvertError do Exit;
              end;
            end;
      finally
        frmENBranchShow.Free;
      end;
    end //if lblBranch.Caption := 'Отходящая линия' then
  else if lblBranch.Caption = 'Расположение на щите' then
    begin
      isLVBnil := False;  //Признак незаполненности НВЩ оборудования
      ENPanelFilterObj := ENPanelFilter.Create;
      SetNullIntProps(ENPanelFilterObj);
      SetNullXSProps(ENPanelFilterObj);
      ENPanelFilterObj.conditionSQL := 'ENPANEL.ELEMENTCODE IN ' +
        '(SELECT CODE FROM ENELEMENT WHERE ELEMENTINREFCODE = ' +
        IntToStr(elementCodeS04) + ')';
      frmENPanelShow := TfrmENPanelShow.Create(
        Application, fmFiltered, ENPanelFilterObj);
      try
        with frmENPanelShow do
          begin
            DisableActions([actInsert, actEdit, actDelete, actFilter,
              actNoFilter]);
            ShowModal;
            if ModalResult = mrOk then
              begin
                if ENMeasurDeviceObj.panel = nil then
                  ENMeasurDeviceObj.panel := ENPanelRef.Create;
                ENMeasurDeviceObj.panel.code := panelCode;
                if ENMeasurDeviceObj.lvbRef = nil then
                  ENMeasurDeviceObj.lvbRef := ENLowVoltBoardRef.Create;
                if sgENPanel.Cells[8, sgENPanel.Row] <> '' then
                  ENMeasurDeviceObj.lvbRef.code :=
                    StrToInt(sgENPanel.Cells[8, sgENPanel.Row])
                else
                  isLVBnil := True; //Признак незаполненности НВЩ оборудования
                memENBranchName.Text := sgENPanel.Cells[7, sgENPanel.Row];
                if memENBranchName.Text <> '' then
                  memENBranchName.Text := memENBranchName.Text + '. ';
                memENBranchName.Text := memENBranchName.Text +
                  sgENPanel.Cells[4, sgENPanel.Row];
                if (sgENPanel.Cells[1, sgENPanel.Row] <> 'Не визначено')
                and (sgENPanel.Cells[1, sgENPanel.Row] <> 'Не визначений') then
                  memENBranchName.Text := memENBranchName.Text + '. '
                    + sgENPanel.Cells[1, sgENPanel.Row];
                memTransformer.Text :=
                  sgENPanel.Cells[5, sgENPanel.Row];
              end;
          end;
      finally
        frmENPanelShow.Free;
      end;
      if isLVBnil then //Если НВЩ оборудования не указан
        begin
          Application.MessageBox(
            PChar('Выбранная панель не связана с трансформатором.' + #13#10 +
            'Поэтому необходимо указать Низковольтный Щит.'),
            PChar('Привязка к НВЩ:'), MB_ICONWARNING);
          ENLowVoltBoardFilterObj := ENLowVoltBoardFilter.Create;
          SetNullIntProps(ENLowVoltBoardFilterObj);
          SetNullXSProps(ENLowVoltBoardFilterObj);
          ENLowVoltBoardFilterObj.conditionSQL :=
            'ENLOWVOLTBOARD.SUBSTATION04REFCODE = ' + IntToStr(codeS04);
          frmENLowVoltBoardShow := TfrmENLowVoltBoardShow.Create(
            Application, fmFiltered, ENLowVoltBoardFilterObj);
          try
            with frmENLowVoltBoardShow do
              begin
                DisableActions([actInsert, actEdit, actDelete, actFilter,
                  actNoFilter]);
                ShowModal;
                if ModalResult = mrOk then
                  begin
                    if ENMeasurDeviceObj.lvbRef = nil then
                      ENMeasurDeviceObj.lvbRef := ENLowVoltBoardRef.Create;
                    ENMeasurDeviceObj.lvbRef.code := lvbCode;
                    memENBranchName.Text :=
                      sgENLowVoltBoard.Cells[1, sgENLowVoltBoard.Row] + '. ' +
                      memENBranchName.Text;
                    memTransformer.Text :=
                      sgENLowVoltBoard.Cells[2, sgENLowVoltBoard.Row];
                    //Привязка Панели к Низковольтному Щиту и Трансформатору
                    TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
                    ENPanelObj := TempENPanel.getObject(panelCode);
                    try
                      if ENPanelObj.lowVoltBoard = nil then
                        ENPanelObj.lowVoltBoard := ENLowVoltBoardRef.Create;
                      ENPanelObj.lowVoltBoard.code := lvbCode;
                      if ENPanelObj.transformer = nil then
                        ENPanelObj.transformer := ENTransformerRef.Create;
                      if sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row] <> ''
                      then
                        ENPanelObj.transformer.code := StrToInt(
                          sgENLowVoltBoard.Cells[3, sgENLowVoltBoard.Row]);
                      TempENPanel.save(ENPanelObj);
                    finally
                      ENPanelObj.Free;
                      ENPanelObj := nil;
                    end;
                  end;
              end;
          finally
            frmENLowVoltBoardShow.Free;
          end;
        end; //if isLVBnil then //Если НВЩ оборудования не указан
    end; //else if lblBranch.Caption = 'Расположение на щите' then
end;

procedure TfrmENMeasurDeviceEdit.spbENHighVoltageSellClick(Sender : TObject);
var  frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
  ENHighVoltageSellFilterObj: ENHighVoltageSellFilter;
begin
  ENHighVoltageSellFilterObj := ENHighVoltageSellFilter.Create;
  SetNullIntProps(ENHighVoltageSellFilterObj);
  SetNullXSProps(ENHighVoltageSellFilterObj);
  if ENSubstation04Obj <> nil then
   if ENSubstation04Obj.element <> nil then
     if ENSubstation04Obj.element.code <> Low(Integer) then
       ENHighVoltageSellFilterObj.conditionSQL :=
         ' ENHIGHVOLTAGESELL.ELEMENTCODE in (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
             +  IntToStr(ENSubstation04Obj.element.code) + ')';
  frmENHighVoltageSellShow := TfrmENHighVoltageSellShow.Create(
    Application, fmNormal, ENHighVoltageSellFilterObj);
  try
    with frmENHighVoltageSellShow do
      if ShowModal = mrOk then
        begin
          try
            if ENMeasurDeviceObj.highvoltageSell = nil then
              ENMeasurDeviceObj.highvoltageSell := ENHighVoltageSell.Create();
            ENMeasurDeviceObj.highvoltageSell.code :=
              StrToInt(GetReturnValue(sgENHighVoltageSell,0));
            edtENHighVoltageSellName.Text :=
              GetReturnValue(sgENHighVoltageSell, 1);
          except
            on EConvertError do Exit;
          end;
        end;
   finally
     frmENHighVoltageSellShow.Free;
   end;
end;



procedure TfrmENMeasurDeviceEdit.spbENMeasurDeviceTypeClick(
  Sender: TObject);
var frmENMeasurDeviceTypeShow: TfrmENMeasurDeviceTypeShow;
begin
   frmENMeasurDeviceTypeShow :=
     TfrmENMeasurDeviceTypeShow.Create(Application, fmNormal);
   try
      with frmENMeasurDeviceTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMeasurDeviceObj.measurDeviceType = nil then
                 ENMeasurDeviceObj.measurDeviceType := ENMeasurDeviceType.Create();
               ENMeasurDeviceObj.measurDeviceType.code :=
                 StrToInt(GetReturnValue(sgENMeasurDeviceType,0));
               edtENMeasurDeviceType.Text :=
                 GetReturnValue(sgENMeasurDeviceType, 1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENMeasurDeviceTypeShow.Free;
   end;
end;

procedure TfrmENMeasurDeviceEdit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      DenyGroupSelection := true;
      if ShowModal = mrOk then
      begin
        try
          if ENMeasurDeviceObj.materialRef = nil then
            ENMeasurDeviceObj.materialRef := TKMaterialsRef.Create;
          ENMeasurDeviceObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialsName.Text := TKMaterialsShort(tvDep.Selected.Data).name;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

end.