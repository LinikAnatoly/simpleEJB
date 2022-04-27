//Редактирование Рубильника
unit EditENContactBreaker;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENContactBreakerController;

type
  TfrmENContactBreakerEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblCurrent : TLabel;
    edtCurrent: TEdit;
    lblENContactBreakerTypeName: TLabel;
    edtENContactBreakerTypeName: TEdit;
    spbENContactBreakerType: TSpeedButton;
    HTTPRIOENContactBreaker: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENElementName: TLabel;
    lblBranch: TLabel;
    spbENBranch: TSpeedButton;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    lblDispName: TLabel;
    edtDispName: TEdit;
    HTTPRIOENBranch: THTTPRIO;
    HTTPRIOENLowVoltBoard: THTTPRIO;
    lblTransformer: TLabel;
    memTransformer: TMemo;
    HTTPRIOENPanel: THTTPRIO;
    HTTPRIOENTransformer: THTTPRIO;
    memENBranchName: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENContactBreakerTypeClick(Sender : TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbENBranchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codeS04, elementCodeS04: Integer;
end;

var frmENContactBreakerEdit: TfrmENContactBreakerEdit;
  ENContactBreakerObj: ENContactBreaker;

implementation

uses
  EditENSubstation04, Main, ShowENContactBreakerType,
  ENContactBreakerTypeController, ShowTKMaterials, TKMaterialsController,
  ENBranchController, ENLowVoltBoardController, ShowENLowVoltBoard,
  ENTransformerController, ENPanelController, ShowENPanel, ENConsts;

{$R *.dfm}

procedure TfrmENContactBreakerEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
  TempENBranch: ENBranchControllerSoapPort;
  ENBranchObj: ENBranch;
  TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  ENLowVoltBoardObj: ENLowVoltBoard;
  TempENTransformer: ENTransformerControllerSoapPort; trObj: ENTransformer;
  TempENPanel: ENPanelControllerSoapPort; pnlObj: ENPanel;
begin
  DisableControls([memENBranchName, edtMaterialsName, memTransformer
    {, edtENContactBreakerTypeName}]);
  SetFloatStyle([edtCurrent]);
  if DialogState = dsView then
  begin
    DisableControls([spbTkMaterials, spbENBranch
      {, spbENContactBreakerType, edtENContactBreakerTypeName}]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
   begin
    DisableControls([spbENBranch], lblBranch.Caption <> 'Расположение на щите');
    DenyBlankValues([edtCurrent, edtMaterialsName]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENContactBreakerObj.code);
      edtDispName.Text := ENContactBreakerObj.name;
      if ( ENContactBreakerObj.current <> nil ) then
         edtCurrent.Text := ENContactBreakerObj.current.decimalString
      else
         edtCurrent.Text := '';

      case deviceParty of //Место оборудования на подстанции
        partyLVBM: //Низковольтная сторона, главная шина низковольтного щита
          begin
            if ENContactBreakerObj.lvbRef <> nil then
              begin
                lblBranch.Caption := 'Расположение на щите';
                TempENLowVoltBoard :=
                  HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                ENLowVoltBoardObj := TempENLowVoltBoard.getObject(ENContactBreakerObj.lvbRef.code);
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
              end; //if ENContactBreakerObj.lvbRef <> nil then
            if ENContactBreakerObj.panel <> nil then
              if ENContactBreakerObj.panel.code <> low(Integer) then
                begin
                  TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
                  pnlObj := TempENPanel.getObject(ENContactBreakerObj.panel.code);
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
                end; //if ENContactBreakerObj.panel.code <> low(Integer) then
          end;
        partyLVBP: //Низковольтная сторона, присоединение на панели низковольтного щита
          if ENContactBreakerObj.branch <> nil then
            if ENContactBreakerObj.branch.code <> low(Integer) then
              begin
                lblBranch.Caption := 'Отходящая линия';
                TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
                ENBranchObj := TempENBranch.getObject(ENContactBreakerObj.branch.code);
                if ENBranchObj <> nil then
                  begin
                    memENBranchName.Text := ENBranchObj.name;
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
                  end; //if ENContactBreakerObj.branch.code <> low(Integer) then
            end;
      end; //case deviceParty of

      if ENContactBreakerObj.materialRef <> nil then
        if ENContactBreakerObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENContactBreakerObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
      //edtENContactBreakerTypeName.Text := ENContactBreakerObj.contactBreakerType.name;
    end;
end;



procedure TfrmENContactBreakerEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContactBreaker: ENContactBreakerControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtCurrent, edtMaterialsName]) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
    end
  else
  begin
    TempENContactBreaker := HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;


     ENContactBreakerObj.name := edtDispName.Text;
     if (ENContactBreakerObj.current = nil ) then
       ENContactBreakerObj.current := TXSDecimal.Create;
     if edtCurrent.Text <> '' then
       ENContactBreakerObj.current.decimalString := edtCurrent.Text
     else
       ENContactBreakerObj.current := nil;

    if DialogState = dsInsert then
    begin
      ENContactBreakerObj.code:=low(Integer);
      TempENContactBreaker.add(ENContactBreakerObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENContactBreaker.save(ENContactBreakerObj);
    end;
  end;
end;


procedure TfrmENContactBreakerEdit.spbENContactBreakerTypeClick(Sender : TObject);
//var frmENContactBreakerTypeShow: TfrmENContactBreakerTypeShow;
begin
   (*frmENContactBreakerTypeShow := TfrmENContactBreakerTypeShow.Create(Application, fmNormal);
   try
      with frmENContactBreakerTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContactBreakerObj.contactBreakerType = nil then ENContactBreakerObj.contactBreakerType := ENContactBreakerType.Create();
               ENContactBreakerObj.contactBreakerType.code := StrToInt(GetReturnValue(sgENContactBreakerType,0));
               edtENContactBreakerTypeName.Text:=GetReturnValue(sgENContactBreakerType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENContactBreakerTypeShow.Free;
   end;*)
end;



procedure TfrmENContactBreakerEdit.spbENElementClick(Sender: TObject);
//var frmENElementShow: TfrmENElementShow;
begin
  (*frmENElementShow := TfrmENElementShow.Create(Application, fmNormal);
  try
    with frmENElementShow do
      if ShowModal = mrOk then
        begin
          try
            if ENContactBreakerObj.element = nil then
              ENContactBreakerObj.element := ENElement.Create();
            ENContactBreakerObj.element.code :=
              StrToInt(GetReturnValue(sgENElement,0));
            edtENElementName.Text := GetReturnValue(sgENElement, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENElementShow.Free;
  end;*)
end;

procedure TfrmENContactBreakerEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENContactBreakerObj.materialRef = nil then
            ENContactBreakerObj.materialRef := TKMaterialsRef.Create;
          ENContactBreakerObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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

procedure TfrmENContactBreakerEdit.spbENBranchClick(Sender: TObject);
var ENLowVoltBoardFilterObj: ENLowVoltBoardFilter;
 ENPanelFilterObj: ENPanelFilter;
 isLVBnil: Boolean;
 TempENPanel: ENPanelControllerSoapPort;
 ENPanelObj: ENPanel;
begin
  if lblBranch.Caption = 'Расположение на щите' then
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
                if ENContactBreakerObj.panel = nil then
                  ENContactBreakerObj.panel := ENPanelRef.Create;
                ENContactBreakerObj.panel.code := panelCode;
                if ENContactBreakerObj.lvbRef = nil then
                  ENContactBreakerObj.lvbRef := ENLowVoltBoardRef.Create;
                if sgENPanel.Cells[8, sgENPanel.Row] <> '' then
                  ENContactBreakerObj.lvbRef.code :=
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
                    if ENContactBreakerObj.lvbRef = nil then
                      ENContactBreakerObj.lvbRef := ENLowVoltBoardRef.Create;
                    ENContactBreakerObj.lvbRef.code := lvbCode;
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
    end; //if lblBranch.Caption = 'Расположение на щите' then
end;

end.
