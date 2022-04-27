unit EditENBranch;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENBranchController, AdvObj ;

type
  TfrmENBranchEdit = class(TDialogForm)
    lblCode: TLabel;
	  edtCode: TEdit;
    lblName: TLabel;
    edtName: TEdit;
    lblBasicConsumer: TLabel;
    HTTPRIOENBranch: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    GrBxBranchType: TGroupBox;
    rbBranchTypeLine04: TRadioButton;
    rbBranchTypeLineCable: TRadioButton;
    spbENLineBranch: TSpeedButton;
    cbBelonging: TComboBox;
    lblBelonging: TLabel;
    lblConsumerCategory: TLabel;
    edtENConsumerCategory: TEdit;
    spbENConsumerCategory: TSpeedButton;
    lblNumberGen: TLabel;
    edtNumberGen: TEdit;
    lblPanelLVB: TLabel;
    edtPanelLVB: TEdit;
    HTTPRIOENLine04: THTTPRIO;
    HTTPRIOENLineCableLVB: THTTPRIO;
    HTTPRIOENPanel: THTTPRIO;
    HTTPRIOENConsumerCategory: THTTPRIO;
    memBasicConsumer: TMemo;
    lblENElement: TLabel;
    edtENElement: TEdit;
    spbENElement: TSpeedButton;
    gbCustomer04: TGroupBox;
    HTTPRIOENCustomer04: THTTPRIO;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    actViewBranch2Customer04: TAction;
    actInsertBranch2Customer04: TAction;
    actDeleteBranch2Customer04: TAction;
    actEditBranch2Customer04: TAction;
    actUpdateBranch2Customer04: TAction;
    actFilterBranch2Customer04: TAction;
    actNoFilterBranch2Customer04: TAction;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    HTTPRIOSpr_matherial: THTTPRIO;
    sgENBranch2Customer04: TAdvStringGrid;
    HTTPRIOENBranch2Customer04: THTTPRIO;
    HTTPRIOAddress: THTTPRIO;
    lblCurrentAdmis: TLabel;
    edtCurrentAdmis: TEdit;
    spbPanelLVB: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENLineBranchClick(Sender: TObject);
    procedure spbENConsumerCategoryClick(Sender: TObject);
    procedure rbBranchTypeLine04MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure rbBranchTypeLineCableMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure rbBranchTypeLine04MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure rbBranchTypeLineCableMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure spbENElementClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure actViewBranch2Customer04Execute(Sender: TObject);
    procedure actInsertBranch2Customer04Execute(Sender: TObject);
    procedure actDeleteBranch2Customer04Execute(Sender: TObject);
    procedure actEditBranch2Customer04Execute(Sender: TObject);
    procedure actUpdateBranch2Customer04Execute(Sender: TObject);
    procedure actFilterBranch2Customer04Execute(Sender: TObject);
    procedure actNoFilterBranch2Customer04Execute(Sender: TObject);
    procedure spbPanelLVBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codeS04: Integer;
    elementCodeS04: Integer;
    procedure UpdateGridBranch2Customer04(Sender: TObject);
end;

const
  btLine04 = 1; //Отходящее Присоединение Воздушной Лини 0,4 кВ
  btLineCable = 2; //Отходящее Присоединение Кабельной Линии

var frmENBranchEdit: TfrmENBranchEdit;
  ENBranchObj: ENBranch;

implementation

uses ShowENLine04, ENLine04Controller, ShowENLineCable, ENLineCableController,
  EditENSubstation04, ENSubstation04Controller, ENElementController,
  ENBranchTypeController, ShowENConsumerCategory, ENConsumerCategoryController,
  ENBelongingController, ENPanelController, ShowENElement,
  ENCustomer04Controller, EditENCustomer04, ENBranch2Customer04Controller,
  EditENBranch2Customer04, ShowTKMaterials, TKMaterialsController,
  AddressController, ShowENPanel, Main;

{$R *.dfm}

var vBranchType: Integer;
  ENLine04BObj: ENLine04;
  ENLineCableBObj: ENLineCable;

  bc04FilterObject: ENBranch2Customer04Filter;
  bc04ColCount, bc04LastCount: Integer;
  bc04LastRow: Integer = 1;
  ENBranch2Customer04Headers: array [1..5] of String =
        ( 'Код'
          ,'Потребитель'
          ,'Адрес'
          ,'Телефон'
          ,'Ток автомата по договору присоединения, А'
        );

procedure TfrmENBranchEdit.FormShow(Sender: TObject);
var TempENPanel: ENPanelControllerSoapPort;
  tmpENPanelObj: ENPanel;
  TempENConsumerCategory: ENConsumerCategoryControllerSoapPort;
  tmpENConsumerCategoryObj: ENConsumerCategory;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
  TempENLine04B: ENLine04ControllerSoapPort;
  TempENLineCableB: ENLineCableControllerSoapPort;
  TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
  ENBranch2Customer04List: ENBranch2Customer04ShortList; i: Integer;
begin
  DisableControls([edtPanelLVB, edtName, edtENConsumerCategory, edtENElement,
    edtMaterialsName]);
  if DialogState = dsView then
    begin
      DisableControls([memBasicConsumer, cbBelonging, edtNumberGen,
        spbENLineBranch, spbENConsumerCategory, spbTkMaterials, spbPanelLVB,
        GrBxBranchType]);
      DisableActions([actInsertBranch2Customer04, actDeleteBranch2Customer04,
        actEditBranch2Customer04])
    end;

  if (DialogState = dsInsert) then
    DisableActions([actInsertBranch2Customer04, actEditBranch2Customer04, actDeleteBranch2Customer04]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName, memBasicConsumer, edtNumberGen]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENBranchObj.code);
      edtName.Text := ENBranchObj.name;
      memBasicConsumer.Text := ENBranchObj.basicConsumer;
      edtNumberGen.Text := ENBranchObj.numberGen;
      if ENBranchObj.branchTypeRef <> nil then
        case ENBranchObj.branchTypeRef.code of
          btLine04:
            begin
              if ENBranchObj.line04Ref <> nil then
                if ENBranchObj.line04Ref.code <> low(Integer) then
                  TempENLine04B :=
                    HTTPRIOENLine04 as ENLine04ControllerSoapPort;
                  try
                    ENLine04BObj :=
                      TempENLine04B.getObject(ENBranchObj.line04Ref.code);
                  except
                    on EConvertError do Exit;
                  end;
              rbBranchTypeLine04.Checked := True;
            end;
          btLineCable:
            begin
              if ENBranchObj.lineCableRef <> nil then
                if ENBranchObj.lineCableRef.code <> low(Integer) then
                  TempENLineCableB :=
                    HTTPRIOENLineCableLVB as ENLineCableControllerSoapPort;
                  try
                    ENLineCableBObj :=
                      TempENLineCableB.getObject(ENBranchObj.lineCableRef.code);
                  except
                    on EConvertError do Exit;
                  end;
              rbBranchTypeLineCable.Checked := True;
            end;
        end;
      if ENBranchObj.panel <> nil then
        if ENBranchObj.panel.code <> Low(Integer) then
          try
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            tmpENPanelObj := TempENPanel.getObject(ENBranchObj.panel.code);
            if tmpENPanelObj <> nil then
              edtPanelLVB.Text := tmpENPanelObj.name;
          finally
            tmpENPanelObj.Free;
          end;
      if ENBranchObj.consumerCategoryRef <> nil then
        if ENBranchObj.consumerCategoryRef.code <> Low(Integer) then
          try
            TempENConsumerCategory :=
              HTTPRIOENConsumerCategory as ENConsumerCategoryControllerSoapPort;
            tmpENConsumerCategoryObj :=
              TempENConsumerCategory.getObject(ENBranchObj.consumerCategoryRef.code);
            if tmpENConsumerCategoryObj <> nil then
              edtENConsumerCategory.Text := tmpENConsumerCategoryObj.name;
          finally
            tmpENConsumerCategoryObj.Free;
          end;
      if ENBranchObj.belongingRef <> nil then
        if ENBranchObj.belongingRef.code <> Low(Integer) then
          cbBelonging.ItemIndex := ENBranchObj.belongingRef.code;

      if ENBranchObj.materialRef <> nil then
        begin
          if ENBranchObj.materialRef.code <> Low(Integer) then
            begin
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
              Spr_matherialFilterObj := TKMaterialsFilter.Create;
              SetNullIntProps(Spr_matherialFilterObj);
              Spr_matherialFilterObj.code := ENBranchObj.materialRef.code;
              Spr_matherialList :=
                TempSpr_matherial.getScrollableFilteredList(
                  Spr_matherialFilterObj, 0, -1);
              if (Spr_matherialList.totalCount > 0) then
                edtMaterialsName.Text := Spr_matherialList.list[0].name
              else
                edtMaterialsName.Text := '';
            end
        end;
      if (ENBranchObj.currentAdmis <> nil) then
        edtCurrentAdmis.Text := ENBranchObj.currentAdmis.decimalString
      else
        edtCurrentAdmis.Text := '';
      //Заполнение списка основных потребитлей
      SetGridHeaders(
        ENBranch2Customer04Headers, sgENBranch2Customer04.ColumnHeaders);
      bc04ColCount := 100;
      TempENBranch2Customer04 :=
        HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;
      bc04FilterObject := ENBranch2Customer04Filter.Create;
      SetNullIntProps(bc04FilterObject);
      SetNullXSProps(bc04FilterObject);
      bc04FilterObject.conditionSQL := 'ENBRANCH2CUSTOMER04.BRANCHREFCODE = ' +
        IntToStr(ENBranchObj.code);
      ENBranch2Customer04List :=
        TempENBranch2Customer04.getScrollableFilteredList(
          ENBranch2Customer04Filter(bc04FilterObject), 0, bc04ColCount);
      bc04LastCount := High(ENBranch2Customer04List.list);

      if bc04LastCount > -1 then
        sgENBranch2Customer04.RowCount := bc04LastCount + 2
      else
        sgENBranch2Customer04.RowCount := 2;

      with sgENBranch2Customer04 do
        for i := 0 to bc04LastCount do
          begin
            Application.ProcessMessages;
            if ENBranch2Customer04List.list[i].code <> Low(Integer) then //Код
              Cells[0, i + 1] := IntToStr(ENBranch2Customer04List.list[i].code)
            else
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := //Потребитель
              ENBranch2Customer04List.list[i].customer04RefName;
            Cells[2, i + 1] := ''; //Адрес
            if ENBranch2Customer04List.list[i].address <> '' then
              Cells[2, i + 1] := ENBranch2Customer04List.list[i].address
            else if ENBranch2Customer04List.list[i].addressRefCode <> low(Integer)
            then
              begin
                if (ENBranch2Customer04List.list[i].regionName <> '') then
                  begin
                    if (ENBranch2Customer04List.list[i].regionCode <> 0)
                    and (ENBranch2Customer04List.list[i].regionCode <> 1) then
                      Cells[2, i + 1] :=
                        ENBranch2Customer04List.list[i].regionName + 'р-н, '
                    else if (ENBranch2Customer04List.list[i].regionCode = 1)
                    and (ENBranch2Customer04List.list[i].cityCode <> 1) then
                      Cells[2, i + 1] :=
                        ENBranch2Customer04List.list[i].regionName + ', ';
                  end;
                if ENBranch2Customer04List.list[i].cityName <> '' then
                  begin
                    if ENBranch2Customer04List.list[i].cityTypeName
                      <> '_невідомо_'
                    then
                      Cells[2, i + 1] := Cells[2, i + 1]
                        + ENBranch2Customer04List.list[i].cityTypeName + ' ';
                      Cells[2, i + 1] := Cells[2, i + 1]
                        + ENBranch2Customer04List.list[i].cityName;
                  end;
                if ENBranch2Customer04List.list[i].streetName <> '' then
                  begin
                    Cells[2, i + 1] := Cells[2, i + 1] + ', ';
                    if ENBranch2Customer04List.list[i].streetTypeName
                      <> '_невідомо_'
                    then
                      Cells[2, i + 1] := Cells[2, i + 1]
                        + ENBranch2Customer04List.list[i].streetTypeName + ' ';
                      Cells[2, i + 1] := Cells[2, i + 1]
                        + ENBranch2Customer04List.list[i].streetName;
                  end;
                if ENBranch2Customer04List.list[i].locationHouse <> '' then
                  Cells[2, i + 1] := Cells[2, i + 1] + ', '
                    + ENBranch2Customer04List.list[i].locationHouse;
                if ENBranch2Customer04List.list[i].locationApp <> '' then
                  Cells[2, i + 1] := Cells[2, i + 1] + ', кв. '
                    + ENBranch2Customer04List.list[i].locationApp;
              end;
            Cells[3, i + 1] := ENBranch2Customer04List.list[i].phone; //Телефон
            //Ток автомата по договору присоединения, А
            if ENBranch2Customer04List.list[i].currentAutomat = nil then
              Cells[4, i + 1] := ''
            else
              Cells[4, i + 1] :=
                ENBranch2Customer04List.list[i].currentAutomat.DecimalString;

            bc04LastRow := i + 1;
            sgENBranch2Customer04.RowCount := bc04LastRow + 1;
          end;
       bc04ColCount := bc04ColCount + 1;
       sgENBranch2Customer04.Row := 1;
    end;
end;



procedure TfrmENBranchEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBranch: ENBranchControllerSoapPort;
  TempENLine04B: ENLine04ControllerSoapPort;
  TempENLineCableB: ENLineCableControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtName, memBasicConsumer, edtNumberGen])  then
    begin
      Application.MessageBox(
        PChar('Пустые поля недопустимы !'),
        PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
    end
  else
    begin
      TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;

      ENBranchObj.name := edtName.Text;
      ENBranchObj.basicConsumer := memBasicConsumer.Text;
      ENBranchObj.numberGen := edtNumberGen.Text;

      if (ENBranchObj.currentAdmis = nil) then
        ENBranchObj.currentAdmis := TXSDecimal.Create;
      if edtCurrentAdmis.Text <> '' then
        ENBranchObj.currentAdmis.decimalString := edtCurrentAdmis.Text
      else
        ENBranchObj.currentAdmis := nil;

      if ENBranchObj.branchTypeRef = nil then
        ENBranchObj.branchTypeRef := ENBranchTypeRef.Create();

      if (rbBranchTypeLine04.Checked) and (ENLine04BObj <> nil) then
        try
          TempENLine04B := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
          TempENLine04B.save(ENLine04BObj);
          ENBranchObj.branchTypeRef.code := btLine04;
          if ENBranchObj.line04Ref = nil then
            ENBranchObj.line04Ref := ENLine04Ref.Create();
          ENBranchObj.line04Ref.code := ENLine04BObj.code;
        finally
          ENLine04BObj.Free;
        end
      else if (rbBranchTypeLineCable.Checked) and (ENLineCableBObj <> nil) then
        try
          TempENLineCableB := HTTPRIOENLineCableLVB as ENLineCableControllerSoapPort;
          TempENLineCableB.save(ENLineCableBObj);
          ENBranchObj.branchTypeRef.code := btLineCable;
          if ENBranchObj.lineCableRef = nil then
            ENBranchObj.lineCableRef := ENLineCableRef.Create();
          ENBranchObj.lineCableRef.code := ENLineCableBObj.code;
        finally
          ENLineCableBObj.Free;
        end
      else
        begin
          Application.MessageBox(
            PChar('Выбранная линия должна соответствовать типу присоединения!'),
            PChar('Внимание!'), MB_ICONWARNING + MB_OK);
          Action := caNone;
        end;

      if ENBranchObj.belongingRef = nil then
        ENBranchObj.belongingRef := ENBelongingRef.Create();
      ENBranchObj.belongingRef.code := cbBelonging.ItemIndex;

      if DialogState = dsInsert then
        begin
          ENBranchObj.code := low(Integer);
          TempENBranch.add(ENBranchObj);
        end
      else if DialogState = dsEdit then
        begin
          TempENBranch.save(ENBranchObj);
        end;
    end;
end;


procedure TfrmENBranchEdit.spbENLineBranchClick(Sender: TObject);
var
  //frmENLine04Show: TfrmENLine04Show;
  ENLine04FilterObj: ENLine04Filter;
  fENLine04Show: TfrmENLine04Show;
  //frmENLineCableShow: TfrmENLineCableShow;
  ENLineCableFilterObj: ENLineCableFilter;
  fENLineCableShow: TfrmENLineCableShow;
  renCondition, condition: String;
  TempENLine04B: ENLine04ControllerSoapPort;
  TempENLineCableB: ENLineCableControllerSoapPort;
begin
  if rbBranchTypeLine04.Checked then
    begin
      ENLine04FilterObj := ENLine04Filter.Create;
      SetNullIntProps(ENLine04FilterObj);
      SetNullXSProps(ENLine04FilterObj);
      if ENSubstation04Obj.element.renRef <> nil then
        begin
          renCondition :=
            ' enline04.elementcode in (select e.code from enelement e where e.renrefcode = '
            + IntToStr(ENSubstation04Obj.element.renRef.code)
            + ' and coalesce(e.elementinrefcode, 0) = 0)';
          if renCondition <> '' then
            AddCondition(condition, renCondition);
          if ENLine04FilterObj.conditionSQL <> '' then
            ENLine04FilterObj.conditionSQL :=
              ENLine04FilterObj.conditionSQL + ' and ' + condition
          else
            ENLine04FilterObj.conditionSQL := condition;
        end;

      if not Assigned(fENLine04Show) then
        fENLine04Show := TfrmENLine04Show.Create(
          Application, fmNormal, ENLine04FilterObj);

      with fENLine04Show do
        DisableActions([actENLine04Insert, actENLine04Edit,
          actENLine04Delete, actENLine04SchemeList]);
      try
        fENLine04Show.ShowModal;
        if fENLine04Show.ModalResult = mrOk then
          begin
            try
              TempENLine04B := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
              ENLine04BObj := TempENLine04B.getObject(
                StrToInt(fENLine04Show.sgENLine04.Cells[0, fENLine04Show.sgENLine04.Row]));
              if ENLine04BObj.element = nil then
                ENLine04BObj.element := ENElement.Create();
              ENLine04BObj.element.elementInRef.code := ENSubstation04Obj.element.code;
              edtName.Text := ENLine04BObj.name;
            except
              on EConvertError do Exit;
            end;
          end;
        (*Объект ENLine04BObj сохраняется в процедуре TfrmENBranchEdit.FormClose*)
      finally
        fENLine04Show.Free;
      end;
    end //if rbBranchTypeLine04.Checked then
  else if rbBranchTypeLineCable.Checked then
    begin
      ENLineCableFilterObj := ENLineCableFilter.Create;
      SetNullIntProps(ENLineCableFilterObj);
      SetNullXSProps(ENLineCableFilterObj);
      if ENSubstation04Obj.element.renRef <> nil then
        begin
          renCondition :=
            ' enLineCable.elementcode in (select e.code from enelement e where e.renrefcode = '
            + IntToStr(ENSubstation04Obj.element.renRef.code)
            + ' and coalesce(e.elementinrefcode, 0) = 0)';
          if renCondition <> '' then
            AddCondition(condition, renCondition);
          if ENLineCableFilterObj.conditionSQL <> '' then
            ENLineCableFilterObj.conditionSQL :=
              ENLineCableFilterObj.conditionSQL + ' and ' + condition
          else
            ENLineCableFilterObj.conditionSQL := condition;
        end;

      if not Assigned(fENLineCableShow) then
        fENLineCableShow := TfrmENLineCableShow.Create(
          Application, fmNormal, ENLineCableFilterObj);

      with fENLineCableShow do
        DisableActions([actInsert, actEdit, actDelete, fENLineCableShow.
        actSchemeList]);
      try
        fENLineCableShow.ShowModal;
        if fENLineCableShow.ModalResult = mrOk then
          begin
            try
              TempENLineCableB := HTTPRIOENLineCableLVB as ENLineCableControllerSoapPort;
              ENLineCableBObj := TempENLineCableB.getObject(
                StrToInt(fENLineCableShow.sgENLineCable.Cells[0, fENLineCableShow.sgENLineCable.Row]));
              if ENLineCableBObj.element = nil then
                ENLineCableBObj.element := ENElement.Create();
              ENLineCableBObj.element.elementInRef.code := ENSubstation04Obj.element.code;
              edtName.Text := ENLineCableBObj.name;
            except
              on EConvertError do Exit;
            end;
          end;
      finally
        fENLineCableShow.Free;
      end;
    end; //else if rbBranchTypeLineCable.Checked then
end;

procedure TfrmENBranchEdit.spbENConsumerCategoryClick(Sender: TObject);
var frmENConsumerCategoryShow: TfrmENConsumerCategoryShow;
begin
  frmENConsumerCategoryShow :=
    TfrmENConsumerCategoryShow.Create(Application, fmNormal);
  try
    with frmENConsumerCategoryShow do
      if ShowModal = mrOk then
        begin
          try
            if ENBranchObj.consumerCategoryRef = nil then
              ENBranchObj.consumerCategoryRef := ENConsumerCategoryRef.Create();
            ENBranchObj.consumerCategoryRef.code :=
              StrToInt(GetReturnValue(sgENConsumerCategory, 0));
            edtENConsumerCategory.Text :=
              GetReturnValue(sgENConsumerCategory, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENConsumerCategoryShow.Free;
  end;
end;

(*Следующие 4 процедуры-события мыши элементов RadioButton предназначены
для очистки названия низковольтного присоединения при смене его типа*)
procedure TfrmENBranchEdit.rbBranchTypeLine04MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if rbBranchTypeLine04.Checked then
    vBranchType := btLine04
  else //if rbBranchTypeLineCable.Checked then
    vBranchType := btLineCable;
end;

procedure TfrmENBranchEdit.rbBranchTypeLineCableMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if rbBranchTypeLine04.Checked then
    vBranchType := btLine04
  else //if rbBranchTypeLineCable.Checked then
    vBranchType := btLineCable;
end;

procedure TfrmENBranchEdit.rbBranchTypeLine04MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (rbBranchTypeLine04.Checked) and (vBranchType <> btLine04) then
    if ENBranchObj.branchTypeRef <> nil then
      begin
        ENBranchObj.branchTypeRef.code := Low(Integer);
        edtName.Text := '';
      end;
end;

procedure TfrmENBranchEdit.rbBranchTypeLineCableMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (rbBranchTypeLineCable.Checked) and (vBranchType <> btLineCable) then
    if ENBranchObj.branchTypeRef <> nil then
      begin
        ENBranchObj.branchTypeRef.code := Low(Integer);
        edtName.Text := '';
      end;
end;

procedure TfrmENBranchEdit.spbENElementClick(Sender: TObject);
//var frmENElementShow: TfrmENElementShow;
begin
  (*frmENElementShow:=TfrmENElementShow.Create(Application, fmNormal);
  try
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
          try
             if ENBranchObj.element = nil then
               ENBranchObj.element := ENElement.Create();
             ENBranchObj.element.code :=
               StrToInt(GetReturnValue(sgENElement, 0));
             edtENElementElementName.Text:=GetReturnValue(sgENElement, 1);
          except
             on EConvertError do Exit;
          end;
      end;
  finally
    frmENElementShow.Free;
  end;*)
end;

procedure TfrmENBranchEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENBranchObj.materialRef = nil then
            ENBranchObj.materialRef := TKMaterialsRef.Create;
          ENBranchObj.materialRef.code :=
            TKMaterialsShort(tvDep.Selected.Data).code;
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

//Связь Потребителей с Присоединением 0,4 кВ
procedure TfrmENBranchEdit.actViewBranch2Customer04Execute(Sender: TObject);
Var TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
begin
  TempENBranch2Customer04 :=
    HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;
  try
    ENBranch2Customer04Obj := TempENBranch2Customer04.getObject(
      StrToInt(sgENBranch2Customer04.Cells[0,sgENBranch2Customer04.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENBranch2Customer04Edit :=
    TfrmENBranch2Customer04Edit.Create(Application, dsView);
  try
    frmENBranch2Customer04Edit.ShowModal;
  finally
    frmENBranch2Customer04Edit.Free;
    frmENBranch2Customer04Edit := nil;
  end;
end;

procedure TfrmENBranchEdit.actEditBranch2Customer04Execute(Sender: TObject);
Var TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
begin
  TempENBranch2Customer04 :=
  HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;
  try
    ENBranch2Customer04Obj :=
      TempENBranch2Customer04.getObject(StrToInt(
        sgENBranch2Customer04.Cells[0, sgENBranch2Customer04.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENBranch2Customer04Edit :=
    TfrmENBranch2Customer04Edit.Create(Application, dsEdit);
  try
    frmENBranch2Customer04Edit.edtENLineBranch.Text :=
        ENBranchObj.numberGen + '. ' + ENBranchObj.name;
    if frmENBranch2Customer04Edit.ShowModal = mrOk then
      UpdateGridBranch2Customer04(Sender);
  finally
    frmENBranch2Customer04Edit.Free;
    frmENBranch2Customer04Edit := nil;
  end;
end;

procedure TfrmENBranchEdit.actDeleteBranch2Customer04Execute(Sender: TObject);
Var TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
  ObjCode: Integer;
begin
  TempENBranch2Customer04 :=
    HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;
  try
    ObjCode :=
      StrToInt(sgENBranch2Customer04.Cells[0,sgENBranch2Customer04.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить Связь потребителя с ' +
      'присоединением 0,4 кВ) ?'),
    PChar('Внимание!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
  then
    begin
      TempENBranch2Customer04.remove(ObjCode);
      UpdateGridBranch2Customer04(Sender);
    end;
end;

procedure TfrmENBranchEdit.actInsertBranch2Customer04Execute(Sender: TObject);
begin
  if ENBranchObj = nil then Exit;
  if ENBranchObj.code = Low(Integer) then Exit;

  ENBranch2Customer04Obj := ENBranch2Customer04.Create;

  try
    ENBranch2Customer04Obj.branchRef := ENBranchRef.Create;
    ENBranch2Customer04Obj.branchRef.code := ENBranchObj.code;
    frmENBranch2Customer04Edit := TfrmENBranch2Customer04Edit.Create(
      Application, dsInsert);
    try
      frmENBranch2Customer04Edit.edtENLineBranch.Text :=
        ENBranchObj.numberGen + '. ' + ENBranchObj.name;
      if frmENBranch2Customer04Edit.ShowModal = mrOk then
        if ENBranch2Customer04Obj <> nil then
            UpdateGridBranch2Customer04(Sender);

    finally
      frmENBranch2Customer04Edit.Free;
      frmENBranch2Customer04Edit := nil;
    end;
  finally
    ENBranch2Customer04Obj.Free;
  end;
end;

procedure TfrmENBranchEdit.actUpdateBranch2Customer04Execute(Sender: TObject);
begin
  UpdateGridBranch2Customer04(Sender);
end;


procedure TfrmENBranchEdit.actFilterBranch2Customer04Execute(Sender: TObject);
begin
  {frmENBranch2Customer04FilterEdit :=
    TfrmENBranch2Customer04FilterEdit.Create(Application, dsInsert);
  try
    ENBranch2Customer04FilterObj := ENBranch2Customer04Filter.Create;
    SetNullIntProps(ENBranch2Customer04FilterObj);
    SetNullXSProps(ENBranch2Customer04FilterObj);

    if frmENBranch2Customer04FilterEdit.ShowModal = mrOk then
      begin
        //bc04FilterObject := ENBranch2Customer04Filter.Create;
        bc04FilterObject := ENBranch2Customer04FilterObj;
        actUpdateExecute(Sender);
      end;
  finally
    frmENBranch2Customer04FilterEdit.Free;
    frmENBranch2Customer04FilterEdit:=nil;
  end;}
end;

procedure TfrmENBranchEdit.actNoFilterBranch2Customer04Execute(Sender: TObject);
begin
  bc04FilterObject.Free;
  bc04FilterObject := nil;
  UpdateGridBranch2Customer04(Sender);
end;

procedure TfrmENBranchEdit.UpdateGridBranch2Customer04(Sender: TObject);
Var i, j: Integer;
begin
 for i := 1 to sgENBranch2Customer04.RowCount - 1 do
   for j := 0 to sgENBranch2Customer04.ColCount - 1 do
     sgENBranch2Customer04.Cells[j, i] := '';
   FormShow(Sender);
end;

procedure TfrmENBranchEdit.spbPanelLVBClick(Sender: TObject);
var ENPanelFilterObj: ENPanelFilter;
begin
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
        DisableActions([actInsert, actEdit, actDelete, actFilter, actNoFilter]);
        ShowModal;
        if ModalResult = mrOk then
          begin
            if ENBranchObj.panel = nil then
              ENBranchObj.panel := ENPanelRef.Create;
            ENBranchObj.panel.code := ShowENPanel.panelCode;
          end;
      end;
  finally
    frmENPanelShow.Free;
    frmENPanelShow := nil;
  end;
end;

end.
