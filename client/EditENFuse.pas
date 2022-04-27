//Редактирование Предохранителя
unit EditENFuse;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENFuseController ;

type
  TfrmENFuseEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblCurrentFuse : TLabel;
    edtCurrentFuse: TEdit;
    lblENFuseTypeName: TLabel;
    edtENFuseTypeName: TEdit;
    spbENFuseType: TSpeedButton;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENHighVoltageSellName: TLabel;
    edtENHighVoltageSellName: TEdit;
    spbENHighVoltageSell: TSpeedButton;
    HTTPRIOENFuse: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblBranch: TLabel;
    spbENBranch: TSpeedButton;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    edtDispName: TEdit;
    lblDispName: TLabel;
    HTTPRIOENLowVoltBoard: THTTPRIO;
    lblENSubstation04: TLabel;
    HTTPRIOENSubstation04: THTTPRIO;
    memENSubstation04: TMemo;
    HTTPRIOENPanel: THTTPRIO;
    memENBranchName: TMemo;
    lblTransformer: TLabel;
    memTransformer: TMemo;
    HTTPRIOENTransformer: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENFuseTypeClick(Sender : TObject);
    procedure spbENElementClick(Sender : TObject);
    procedure spbENHighVoltageSellClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbENBranchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codeS04, elementCodeS04: Integer;
end;

var frmENFuseEdit: TfrmENFuseEdit; ENFuseObj: ENFuse;

implementation

uses EditENSubstation04, ShowENFuseType, ENFuseTypeController, ShowENElement,
  ENElementController, ShowENHighVoltageSell, ENHighVoltageSellController,
  ShowTKMaterials, TKMaterialsController, ENLowVoltBoardController,
  ShowENPanel, ENPanelController, ENTransformerController, ShowENLowVoltBoard,
  Main, ENConsts;

{$R *.dfm}

procedure TfrmENFuseEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  ENLowVoltBoardObj: ENLowVoltBoard;
  TempENPanel: ENPanelControllerSoapPort;
  ENPanelObj: ENPanel;
  TempENTransformer: ENTransformerControllerSoapPort; trObj: ENTransformer;
begin
  FormatSettings.DecimalSeparator := '.';
  DisableControls([edtENHighVoltageSellName, memENBranchName, edtMaterialsName,
    memENSubstation04, memTransformer {, edtENFuseTypeName}]);
  SetFloatStyle([edtCurrentFuse]);
  if DialogState = dsView then
  begin
    DisableControls([edtENHighVoltageSellName, spbENHighVoltageSell,
      spbENBranch, spbTkMaterials
      {, spbENFuseType, spbENElement, edtENElementName}]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
   begin
     DisableControls([spbENBranch], lblBranch.Caption <> 'Расположение на щите');
     DenyBlankValues([edtCurrentFuse, edtMaterialsName]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENFuseObj.code);
      edtDispName.Text := ENFuseObj.name;
      if ( ENFuseObj.currentFuse <> nil ) then
         edtCurrentFuse.Text := ENFuseObj.currentFuse.decimalString
      else
         edtCurrentFuse.Text := '';
      //edtENFuseTypeName.Text := ENFuseObj.fuseType.name;

      case deviceParty of //Место оборудования на подстанции
        partyHVS: //Высоковольтная сторона, ячейка
          if ENFuseObj.highVoltageSell <> nil then
            begin
              edtENHighVoltageSellName.Text :=
                'Ячейка № ' + ENFuseObj.highVoltageSell.numberGen;
              if ENFuseObj.highVoltageSell.transformerRef <> nil then
                if ENFuseObj.highVoltageSell.transformerRef.code <> low(Integer)
                then
                  begin
                    TempENTransformer := HTTPRIOENTransformer
                      as ENTransformerControllerSoapPort;
                    trObj := TempENTransformer.getObject(
                      ENFuseObj.highVoltageSell.code);
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
                  end; //if ENFuseObj.highVoltageSell.transformerRef.code...
            end; //if ENFuseObj.highVoltageSell <> nil then
        partyLVBM: //Низковольтная сторона, главная шина низковольтного щита
          begin
            if ENFuseObj.lvbRef <> nil then
              begin
                lblBranch.Caption := 'Расположение на щите';
                TempENLowVoltBoard :=
                  HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                ENLowVoltBoardObj := TempENLowVoltBoard.getObject(ENFuseObj.lvbRef.code);
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
              end; //if ENFuseObj.lvbRef <> nil then
            if ENFuseObj.panel <> nil then
              if ENFuseObj.panel.code <> low(Integer) then
                begin
                  TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
                  ENPanelObj := TempENPanel.getObject(ENFuseObj.panel.code);
                  try
                    if memENBranchName.Text <> '' then
                      memENBranchName.Text := memENBranchName.Text + '. ';
                    memENBranchName.Text := memENBranchName.Text + ENPanelObj.name;
                    if ENPanelObj.panelType <> nil then
                      if ENPanelObj.panelType.code <> low(Integer) then
                        if ENPanelObj.panelType.code <> ENPNL_NOTDEFINED then
                          memENBranchName.Text := memENBranchName.Text + '. ' +
                            ENPanelObj.panelType.name;
                  finally
                    ENPanelObj.Free;
                    ENPanelObj := nil;
                  end;
                end; //if ENFuseObj.panel.code <> low(Integer) then
          end;
        partyLVBP: //Низковольтная сторона, присоединение на панели низковольтного щита
          if ENFuseObj.branch <> nil then
            if ENFuseObj.branch.code <> low(Integer) then
              begin
                lblBranch.Caption := 'Отходящая линия';
                memENBranchName.Text :=
                  ENFuseObj.branch.numberGen + ' ' + ENFuseObj.branch.name;
                if ENFuseObj.branch.panel <> nil then
                  if ENFuseObj.branch.panel.code <> low(Integer) then
                    begin
                      TempENPanel :=
                        HTTPRIOENPanel as ENPanelControllerSoapPort;
                      ENPanelObj :=
                        TempENPanel.getObject(ENFuseObj.branch.panel.code);
                      try
                        memENBranchName.Text :=
                          ENPanelObj.name + '. ' + memENBranchName.Text;
                        if ENPanelObj.transformer <> nil then
                          if ENPanelObj.transformer.code <> low(Integer) then
                            begin
                              TempENTransformer := HTTPRIOENTransformer as
                                ENTransformerControllerSoapPort;
                              trObj := TempENTransformer.getObject(
                                ENPanelObj.transformer.code);
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
                            end; //if ENPanelObj.transformer <> nil then
                      finally
                        ENPanelObj.Free;
                        ENPanelObj := nil;
                      end;
                    end; //if ENFuseObj.branch.panel.code <> low(Integer) then
              end; //if ENFuseObj.branch.code <> low(Integer) then
      end; //case deviceParty of

      if ENFuseObj.materialRef <> nil then
        if ENFuseObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENFuseObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

      //edtENElementName.Text := ENFuseObj.element.name;
    end;
end;



procedure TfrmENFuseEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuse: ENFuseControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtCurrentFuse, edtMaterialsName])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENFuse := HTTPRIOENFuse as ENFuseControllerSoapPort;


     ENFuseObj.name := edtDispName.Text;
     if (ENFuseObj.currentFuse = nil ) then
       ENFuseObj.currentFuse := TXSDecimal.Create;
     if edtCurrentFuse.Text <> '' then
       ENFuseObj.currentFuse.decimalString := edtCurrentFuse.Text 
     else
       ENFuseObj.currentFuse := nil;

    //Поле ТИП ПРЕДОХРАНИТЕЛЯ не актуально
    (*
    if ENFuseObj.FuseType <> nil then
      begin
        if ENFuseObj.FuseType.code = low(Integer) then
          begin
            Application.MessageBox(PChar('Оберіть тип запобіжника!'),
              PChar('Увага '), MB_ICONWARNING + MB_OK);
            if edtENFuseTypeName.CanFocus then
              edtENFuseTypeName.SetFocus;
            Action := caNone;
            Abort;
          end;
      end
    else
      begin
        Application.MessageBox(PChar('Оберіть тип запобіжника!'),
          PChar('Увага !'), MB_ICONWARNING + MB_OK);
        if edtENFuseTypeName.CanFocus then
          edtENFuseTypeName.SetFocus;
        Action := caNone;
        Abort;
      end;*)

    if deviceParty = partyHVS then
      begin //Если предохранитель находится на высоковольтной стороне
        if ENFuseObj.highVoltageSell <> nil then
          begin
            if ENFuseObj.highVoltageSell.code = low(Integer) then
              begin
                Application.MessageBox(PChar('Оберіть високовольтну чарунку!'),
                  PChar('Увага '), MB_ICONWARNING + MB_OK);
                if edtENHighVoltageSellName.CanFocus then
                  edtENHighVoltageSellName.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('Оберіть високовольтну чарунку!'),
              PChar('Увага !'), MB_ICONWARNING + MB_OK);
            if edtENHighVoltageSellName.CanFocus then
              edtENHighVoltageSellName.SetFocus;
            Action := caNone;
            Abort;
          end;
      end
    else if deviceParty = partyLVBM then
      begin //Если предохранитель находится на низковольтном щите
      end
    else if deviceParty = partyLVBP then
      begin //Если предохранитель находится на панели низковольтного щита
      end;

    if DialogState = dsInsert then
    begin
      ENFuseObj.code:=low(Integer);
      TempENFuse.add(ENFuseObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuse.save(ENFuseObj);
    end;
  end;
end;


procedure TfrmENFuseEdit.spbENFuseTypeClick(Sender : TObject);
//var frmENFuseTypeShow: TfrmENFuseTypeShow;
begin
   {frmENFuseTypeShow:=TfrmENFuseTypeShow.Create(Application,fmNormal);
   try
      with frmENFuseTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuseObj.fuseType = nil then ENFuseObj.fuseType := ENFuseType.Create();
               ENFuseObj.fuseType.code := StrToInt(GetReturnValue(sgENFuseType,0));
               edtENFuseTypeName.Text:=GetReturnValue(sgENFuseType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENFuseTypeShow.Free;
   end;}
end;



procedure TfrmENFuseEdit.spbENElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuseObj.element = nil then ENFuseObj.element := ENElement.Create();
               ENFuseObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENFuseEdit.spbENHighVoltageSellClick(Sender : TObject);
var frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
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
            if ENFuseObj.highVoltageSell = nil then
              ENFuseObj.highVoltageSell := ENHighVoltageSell.Create();
            ENFuseObj.highVoltageSell.code :=
              StrToInt(GetReturnValue(sgENHighVoltageSell, 0));
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

procedure TfrmENFuseEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENFuseObj.materialRef = nil then
            ENFuseObj.materialRef := TKMaterialsRef.Create;
          ENFuseObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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

procedure TfrmENFuseEdit.spbENBranchClick(Sender: TObject);
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
                if ENFuseObj.panel = nil then
                  ENFuseObj.panel := ENPanelRef.Create;
                ENFuseObj.panel.code := panelCode;
                if ENFuseObj.lvbRef = nil then
                  ENFuseObj.lvbRef := ENLowVoltBoardRef.Create;
                if sgENPanel.Cells[8, sgENPanel.Row] <> '' then
                  ENFuseObj.lvbRef.code :=
                    StrToInt(sgENPanel.Cells[8, sgENPanel.Row])
                else
                  isLVBnil := True; //Признак незаполненности НВЩ оборудования
                memENBranchName.Text := sgENPanel.Cells[7, sgENPanel.Row];
                if memENBranchName.Text <> '' then
                  memENBranchName.Text := memENBranchName.Text + '. ';
                memENBranchName.Text := memENBranchName.Text +
                  sgENPanel.Cells[4, sgENPanel.Row] + '. '
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
                    if ENFuseObj.lvbRef = nil then
                      ENFuseObj.lvbRef := ENLowVoltBoardRef.Create;
                    ENFuseObj.lvbRef.code := lvbCode;
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
