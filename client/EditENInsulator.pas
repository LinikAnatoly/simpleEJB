//Редактирование Изолятора
unit EditENInsulator;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENInsulatorController;

type
  TfrmENInsulatorEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblVoltage : TLabel;
    edtVoltage: TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblENInsulatorTypeName: TLabel;
    edtENInsulatorTypeName: TEdit;
    spbENInsulatorType: TSpeedButton;
    lblENElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENHighVoltageSellName: TLabel;
    edtENHighVoltageSellName: TEdit;
    spbENHighVoltageSell: TSpeedButton;
    HTTPRIOENInsulator: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    lblDispName: TLabel;
    edtDispName: TEdit;
    lblENSubstation04: TLabel;
    HTTPRIOENSubstation04: THTTPRIO;
    memENSubstation04: TMemo;
    lblENLine10: TLabel;
    HTTPRIOENLine10: THTTPRIO;
    memENLine10: TMemo;
    lblENPostRefNubmerGen: TLabel;
    HTTPRIOENPost: THTTPRIO;
    edtENPostRefNubmerGen: TEdit;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENInsulatorTypeClick(Sender : TObject);
    procedure spbENElementClick(Sender : TObject);
    procedure spbENHighVoltageSellClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var frmENInsulatorEdit: TfrmENInsulatorEdit;
  ENInsulatorObj: ENInsulator;

implementation

uses EditENSubstation04, ENSubstation04Controller, ShowENInsulatorType,
  ENInsulatorTypeController, ShowENElement, ENElementController,
  ShowENHighVoltageSell, ENHighVoltageSellController, ShowTKMaterials,
  TKMaterialsController, ENLine10Controller, ENPostController;

{$R *.dfm}

procedure TfrmENInsulatorEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENS04: ENSubstation04ControllerSoapPort;
  fENS04: ENSubstation04Filter;
  lstENS04: ENSubstation04ShortList;
  TempENL10: ENLine10ControllerSoapPort;
  objENL10: ENLine10;
  TempENPost: ENPostControllerSoapPort;
  objENPost: ENPost;
begin
  FormatSettings.DecimalSeparator := '.';
  DisableControls([memENSubstation04, edtENHighVoltageSellName, memENLine10,
    edtENPostRefNubmerGen, edtMaterialsName {, edtENInsulatorTypeName}]);
  SetFloatStyle([edtVoltage, edtNumberGen]);
  if DialogState = dsView then
    DisableControls([edtENHighVoltageSellName, spbENHighVoltageSell,
      spbTkMaterials {, spbENElement, spbENInsulatorType, edtENElementName}]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtVoltage, edtNumberGen, edtMaterialsName]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENInsulatorObj.code);
      edtDispName.Text := ENInsulatorObj.name;
      if ( ENInsulatorObj.voltage <> nil ) then
         edtVoltage.Text := ENInsulatorObj.voltage.decimalString
      else
         edtVoltage.Text := '';
      if ( ENInsulatorObj.numberGen <> nil ) then
         edtNumberGen.Text := ENInsulatorObj.numberGen.decimalString
      else
         edtNumberGen.Text := '';

      if ENInsulatorObj.insulatorType <> nil then
        if ENInsulatorObj.insulatorType.code <> low(Integer) then
          edtENInsulatorTypeName.Text := ENInsulatorObj.insulatorType.name;

      if ENInsulatorObj.highvoltageSell <> nil then
        if ENInsulatorObj.highvoltageSell.code <> low(Integer) then
          begin
            edtENHighVoltageSellName.Text :=
              'Ячейка № ' + ENInsulatorObj.highvoltageSell.numberGen;
            if ENInsulatorObj.highvoltageSell.element <> nil then
              if ENInsulatorObj.highvoltageSell.element.elementInRef <> nil
              then
                if ENInsulatorObj.highvoltageSell.element.elementInRef.code
                  <> low(Integer)
                then
                  begin
                    fENS04 := ENSubstation04Filter.Create;
                    try
                      SetNullIntProps(fENS04);
                      SetNullXSProps(fENS04);
                      fENS04.conditionSQL := ' ENSUBSTATION04.ELEMENTCODE = '
                        + IntToStr(
                          ENInsulatorObj.highvoltageSell.element.elementInRef.code);
                      try
                        TempENS04 := HTTPRIOENSubstation04
                          as ENSubstation04ControllerSoapPort;
                        lstENS04 := TempENS04.getScrollableFilteredList(
                          fENS04, 0, -1);
                        if lstENS04.totalCount > 0 then
                          memENSubstation04.Text := lstENS04.list[0].renRefName
                            + '. ' + lstENS04.list[0].name;
                      except
                      end;
                    finally
                      fENS04.Free;
                      fENS04 := nil;
                    end;
                  end;
        end; //if ENInsulatorObj.highvoltageSell.code <> low(Integer) then

      if ENInsulatorObj.line10Ref <> nil then
        if ENInsulatorObj.line10Ref.code <> low(Integer) then
          try
            TempENL10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
            objENL10 := TempENL10.getObject(ENInsulatorObj.line10Ref.code);
            try
              if objENL10.element <> nil then
                if objENL10.element.renRef <> nil then
                  memENLine10.Text := objENL10.element.renRef.name;
              if memENLine10.Text <> '' then
                memENLine10.Text := memENLine10.Text + '. ';
              memENLine10.Text := memENLine10.Text + objENL10.name;
            finally
              objENL10.Free;
              objENL10 := nil;
            end;
          except
          end;

      if ENInsulatorObj.postRef <> nil then
        if ENInsulatorObj.postRef.code <> low(Integer) then
          try
            TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
            objENPost := TempENPost.getObject(ENInsulatorObj.postRef.code);
            try
              edtENPostRefNubmerGen.Text := objENPost.postNumberGen;
            finally
              objENPost.Free;
              objENPost := nil;
            end;
          except
          end;

      if ENInsulatorObj.materialRef <> nil then
        if ENInsulatorObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENInsulatorObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

      //edtENElementName.Text := ENInsulatorObj.element.name;
    end;
end;



procedure TfrmENInsulatorEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENInsulator: ENInsulatorControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtVoltage, edtMaterialsName])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;


     ENInsulatorObj.name := edtDispName.Text;
     if (ENInsulatorObj.voltage = nil ) then
       ENInsulatorObj.voltage := TXSDecimal.Create;
     if edtVoltage.Text <> '' then
       ENInsulatorObj.voltage.decimalString := edtVoltage.Text 
     else
       ENInsulatorObj.voltage := nil;

     if (ENInsulatorObj.numberGen = nil ) then
       ENInsulatorObj.numberGen := TXSDecimal.Create;
     {if edtNumberGen.Text <> '' then
       ENInsulatorObj.numberGen.decimalString := edtNumberGen.Text
     else
       ENInsulatorObj.numberGen := nil;}
     ENInsulatorObj.numberGen.decimalString := '1';

    //Поле ТИП ИЗОЛЯТОРА не актуально
    (*
    if ENInsulatorObj.InsulatorType <> nil then
      begin
        if ENInsulatorObj.InsulatorType.code = low(Integer) then
          begin
            Application.MessageBox(PChar('Оберіть тип ізолятора!'),
              PChar('Увага '), MB_ICONWARNING + MB_OK);
            if edtENInsulatorTypeName.CanFocus then
              edtENInsulatorTypeName.SetFocus;
            Action := caNone;
            Abort;
          end;
      end
    else
      begin
        Application.MessageBox(PChar('Оберіть тип ізолятора!'),
          PChar('Увага !'), MB_ICONWARNING + MB_OK);
        if edtENInsulatorTypeName.CanFocus then
          edtENInsulatorTypeName.SetFocus;
        Action := caNone;
        Abort;
      end;*)

    if (spbENHighVoltageSell.Visible) and (spbENHighVoltageSell.Enabled) then
      if ENInsulatorObj.highvoltageSell <> nil then
        begin
          if ENInsulatorObj.highvoltageSell.code = low(Integer) then
            begin
              Application.MessageBox(PChar('Оберіть високовольтну ланку!'),
                PChar('Увага '), MB_ICONWARNING + MB_OK);
              if edtENHighVoltageSellName.CanFocus then
                edtENHighVoltageSellName.SetFocus;
              Action := caNone;
              Abort;
            end;
        end
      else
        begin
          Application.MessageBox(PChar('Оберіть високовольтну ланку!'),
            PChar('Увага !'), MB_ICONWARNING + MB_OK);
          if edtENHighVoltageSellName.CanFocus then
            edtENHighVoltageSellName.SetFocus;
          Action := caNone;
          Abort;
        end;

    if DialogState = dsInsert then
    begin
      ENInsulatorObj.code:=low(Integer);
      TempENInsulator.add(ENInsulatorObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENInsulator.save(ENInsulatorObj);
    end;
  end;
end;


procedure TfrmENInsulatorEdit.spbENInsulatorTypeClick(Sender : TObject);
var frmENInsulatorTypeShow: TfrmENInsulatorTypeShow;
begin
  frmENInsulatorTypeShow:=TfrmENInsulatorTypeShow.Create(Application,fmNormal);
  try
    with frmENInsulatorTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENInsulatorObj.insulatorType = nil then
              ENInsulatorObj.insulatorType := ENInsulatorType.Create();
            ENInsulatorObj.insulatorType.code :=
              StrToInt(GetReturnValue(sgENInsulatorType, 0));
            edtENInsulatorTypeName.Text:=GetReturnValue(sgENInsulatorType, 1);
          except
             on EConvertError do Exit;
          end;
        end;
  finally
    frmENInsulatorTypeShow.Free;
  end;
end;

procedure TfrmENInsulatorEdit.spbENElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENInsulatorObj.element = nil then ENInsulatorObj.element := ENElement.Create();
               ENInsulatorObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENInsulatorEdit.spbENHighVoltageSellClick(Sender : TObject);
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
            if ENInsulatorObj.highvoltageSell = nil then
              ENInsulatorObj.highvoltageSell := ENHighVoltageSell.Create();
            ENInsulatorObj.highvoltageSell.code :=
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

procedure TfrmENInsulatorEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENInsulatorObj.materialRef = nil then
            ENInsulatorObj.materialRef := TKMaterialsRef.Create;
          ENInsulatorObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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
