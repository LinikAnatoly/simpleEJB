//Редактирование Выключателя Нагрузки
unit EditENLoadSwitch;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENLoadSwitchController;

type
  TfrmENLoadSwitchEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblRatedVoltage : TLabel;
    edtRatedVoltage: TEdit;
    lblRatedCurrent : TLabel;
    edtRatedCurrent: TEdit;
    edtENLoadSwitchTypeName: TEdit;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENHighVoltageSell: TLabel;
    edtENHighVoltageSellName: TEdit;
    spbENHighVoltageSell: TSpeedButton;
    HTTPRIOENLoadSwitch: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    spbENLoadSwitchType: TSpeedButton;
    lblENLoadSwitchTypeName: TLabel;
    lblENLoadSwitchDriveType: TLabel;
    edtENLoadSwitchDriveType: TEdit;
    spbENLoadSwitchDriveType: TSpeedButton;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    lblMatDrive: TLabel;
    spbMatDrive: TSpeedButton;
    edtMatDrive: TEdit;
    edtDispName: TEdit;
    lblDispName: TLabel;
    lblENSubstation04: TLabel;
    HTTPRIOENSubstation04: THTTPRIO;
    memENSubstation04: TMemo;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENLoadSwitchTypeClick(Sender : TObject);
    procedure spbENElementClick(Sender : TObject);
    procedure spbENHighVoltageSellClick(Sender : TObject);
    procedure spbENLoadSwitchDriveTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbMatDriveClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var frmENLoadSwitchEdit: TfrmENLoadSwitchEdit;
  ENLoadSwitchObj: ENLoadSwitch;

implementation

uses
  EditENSubstation04, ENSubstation04Controller,
  ShowENLoadSwitchType, ENLoadSwitchTypeController,
  ShowENElement, ENElementController,
  ShowENHighVoltageSell, ENHighVoltageSellController,
  ShowENLoadSwitchDriveType, ENLoadSwitchDriveTypeController,
  ShowTKMaterials, TKMaterialsController
;

{$R *.dfm}

procedure TfrmENLoadSwitchEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  matDriveObj: TKMaterials; //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENS04: ENSubstation04ControllerSoapPort;
  fENS04: ENSubstation04Filter;
  lstENS04: ENSubstation04ShortList;
begin
  DisableControls([edtENHighVoltageSellName, edtMaterialsName, edtMatDrive,
    memENSubstation04 {, edtENLoadSwitchDriveType, edtENLoadSwitchTypeName}]);
  SetFloatStyle([edtRatedVoltage, edtRatedCurrent]);

  if DialogState = dsView then
   begin
    DisableControls([edtENHighVoltageSellName, spbENHighVoltageSell,
      spbENLoadSwitchDriveType, spbTkMaterials, spbMatDrive
      {, spbENLoadSwitchType, edtENElementName, spbENElement}]);
   end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
   begin
    DenyBlankValues([edtRatedVoltage, edtRatedCurrent, edtMaterialsName]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENLoadSwitchObj.code);
      edtDispName.Text := ENLoadSwitchObj.name;
      if ( ENLoadSwitchObj.ratedVoltage <> nil ) then
         edtRatedVoltage.Text := ENLoadSwitchObj.ratedVoltage.decimalString
      else
         edtRatedVoltage.Text := ''; 
      if ( ENLoadSwitchObj.ratedCurrent <> nil ) then
         edtRatedCurrent.Text := ENLoadSwitchObj.ratedCurrent.decimalString
      else
         edtRatedCurrent.Text := '';

      (*edtENLoadSwitchTypeName.Text := ENLoadSwitchObj.loadswitchType.name;
      edtENLoadSwitchDriveType.Text :=
          ENLoadSwitchObj.loadswitchdriveType.name;*)

      if ENLoadSwitchObj.highvoltageSell <> nil then
        begin
          if ENLoadSwitchObj.highvoltageSell.code <> low(Integer) then
            edtENHighVoltageSellName.Text :=
              'Ячейка № ' + ENLoadSwitchObj.highvoltageSell.numberGen;
          if ENLoadSwitchObj.highvoltageSell.element <> nil then
            if ENLoadSwitchObj.highvoltageSell.element.elementInRef <> nil
            then
              if ENLoadSwitchObj.highvoltageSell.element.elementInRef.code
                <> low(Integer)
              then
                begin
                  fENS04 := ENSubstation04Filter.Create;
                  try
                    SetNullIntProps(fENS04);
                    SetNullXSProps(fENS04);
                    fENS04.conditionSQL := ' ENSUBSTATION04.ELEMENTCODE = '
                      + IntToStr(
                        ENLoadSwitchObj.highvoltageSell.element.elementInRef.code);
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
        end;

      if ENLoadSwitchObj.materialRef <> nil then
        if ENLoadSwitchObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENLoadSwitchObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

      if ENLoadSwitchObj.matDriveRef <> nil then
        if ENLoadSwitchObj.matDriveRef.code <> Low(Integer) then
          begin
            if TempSpr_matherial = nil then
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            matDriveObj :=
              TempSpr_matherial.getObject(ENLoadSwitchObj.matDriveRef.code);
            edtMatDrive.Text := matDriveObj.name;
          end;

      //edtENElementName.Text := ENLoadSwitchObj.element.name;
    end;
end;



procedure TfrmENLoadSwitchEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtRatedVoltage, edtRatedCurrent{, edtMaterialsName}])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;


     ENLoadSwitchObj.name := edtDispName.Text;
     if (ENLoadSwitchObj.ratedVoltage = nil ) then
       ENLoadSwitchObj.ratedVoltage := TXSDecimal.Create;
     if edtRatedVoltage.Text <> '' then
       ENLoadSwitchObj.ratedVoltage.decimalString := edtRatedVoltage.Text 
     else
       ENLoadSwitchObj.ratedVoltage := nil;

     if (ENLoadSwitchObj.ratedCurrent = nil ) then
       ENLoadSwitchObj.ratedCurrent := TXSDecimal.Create;
     if edtRatedCurrent.Text <> '' then
       ENLoadSwitchObj.ratedCurrent.decimalString := edtRatedCurrent.Text 
     else
       ENLoadSwitchObj.ratedCurrent := nil;

    //Поле ТИП ВЫКЛЮЧАТЕЛЯ НАГРУЗКИ не актуально
    (*
    if ENLoadSwitchObj.loadswitchType <> nil then
      begin
        if ENLoadSwitchObj.loadswitchType.code = low(Integer) then
          begin
            Application.MessageBox(PChar('Оберіть тип вимикача навантаження!'),
              PChar('Увага '), MB_ICONWARNING + MB_OK);
            if edtENLoadSwitchTypeName.CanFocus then
              edtENLoadSwitchTypeName.SetFocus;
            Action := caNone;
            Abort;
          end;
      end
    else
      begin
        Application.MessageBox(PChar('Оберіть тип вимикача навантаження!'),
          PChar('Увага !'), MB_ICONWARNING + MB_OK);
        if edtENLoadSwitchTypeName.CanFocus then
          edtENLoadSwitchTypeName.SetFocus;
        Action := caNone;
        Abort;
      end;*)

    if ENLoadSwitchObj.highvoltageSell <> nil then
      begin
        if ENLoadSwitchObj.highvoltageSell.code = low(Integer) then
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
        Application.MessageBox(PChar('Оберіть високовольтну чарунку!'),
          PChar('Увага !'), MB_ICONWARNING + MB_OK);
        if edtENHighVoltageSellName.CanFocus then
          edtENHighVoltageSellName.SetFocus;
        Action := caNone;
        Abort;
      end;

    if ENLoadSwitchObj.materialRef <> nil then
      begin
        if ENLoadSwitchObj.materialRef.code = low(Integer) then
          begin
            Application.MessageBox(PChar('Оберіть вимикач навантаження!'),
              PChar('Увага!'), MB_ICONWARNING + MB_OK);
            if edtMaterialsName.CanFocus then
              edtMaterialsName.SetFocus;
            Action := caNone;
            Abort;
          end;
      end
    else
      begin
        Application.MessageBox(PChar('Оберіть вимикач навантаження!'),
          PChar('Увага!'), MB_ICONWARNING + MB_OK);
        if edtMaterialsName.CanFocus then
          edtMaterialsName.SetFocus;
        Action := caNone;
        Abort;
      end;

    if ENLoadSwitchObj.matDriveRef <> nil then
      begin
        if ENLoadSwitchObj.matDriveRef.code = low(Integer) then
          begin
            Application.MessageBox(PChar('Оберіть привід вимикача навантаження!'),
              PChar('Увага!'), MB_ICONWARNING + MB_OK);
            if edtMatDrive.CanFocus then
              edtMatDrive.SetFocus;
            Action := caNone;
            Abort;
          end;
      end
    else
      begin
        Application.MessageBox(PChar('Оберіть привід вимикача навантаження!'),
          PChar('Увага!'), MB_ICONWARNING + MB_OK);
        if edtMatDrive.CanFocus then
          edtMatDrive.SetFocus;
        Action := caNone;
        Abort;
      end;

    if DialogState = dsInsert then
    begin
      ENLoadSwitchObj.code:=low(Integer);
      TempENLoadSwitch.add(ENLoadSwitchObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLoadSwitch.save(ENLoadSwitchObj);
    end;
  end;
end;


procedure TfrmENLoadSwitchEdit.spbENLoadSwitchTypeClick(Sender : TObject);
//var frmENLoadSwitchTypeShow: TfrmENLoadSwitchTypeShow;
begin
   {frmENLoadSwitchTypeShow:=TfrmENLoadSwitchTypeShow.Create(Application,fmNormal);
   try
      with frmENLoadSwitchTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLoadSwitchObj.loadswitchType = nil then ENLoadSwitchObj.loadswitchType := ENLoadSwitchType.Create();
               ENLoadSwitchObj.loadswitchType.code := StrToInt(GetReturnValue(sgENLoadSwitchType,0));
               edtENLoadSwitchTypeName.Text:=GetReturnValue(sgENLoadSwitchType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENLoadSwitchTypeShow.Free;
   end;}
end;



procedure TfrmENLoadSwitchEdit.spbENElementClick(Sender : TObject);
//var frmENElementShow: TfrmENElementShow;
begin
   {frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLoadSwitchObj.element = nil then ENLoadSwitchObj.element := ENElement.Create();
               ENLoadSwitchObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;}
end;

procedure TfrmENLoadSwitchEdit.spbENHighVoltageSellClick(Sender : TObject);
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
            if ENLoadSwitchObj.highvoltageSell = nil then
              ENLoadSwitchObj.highvoltageSell := ENHighVoltageSell.Create();
            ENLoadSwitchObj.highvoltageSell.code :=
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

procedure TfrmENLoadSwitchEdit.spbENLoadSwitchDriveTypeClick(Sender: TObject);
//var frmENLoadSwitchDriveTypeShow: TfrmENLoadSwitchDriveTypeShow;
begin
   (*frmENLoadSwitchDriveTypeShow:=TfrmENLoadSwitchDriveTypeShow.Create(Application,fmNormal);
   try
      with frmENLoadSwitchDriveTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLoadSwitchObj.loadswitchDriveType = nil then ENLoadSwitchObj.loadswitchDriveType := ENLoadSwitchDriveType.Create();
               ENLoadSwitchObj.loadswitchDriveType.code := StrToInt(GetReturnValue(sgENLoadSwitchDriveType,0));
               edtENLoadSwitchDriveType.Text:=GetReturnValue(sgENLoadSwitchDriveType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENLoadSwitchDriveTypeShow.Free;
   end;*)
end;

procedure TfrmENLoadSwitchEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENLoadSwitchObj.materialRef = nil then
            ENLoadSwitchObj.materialRef := TKMaterialsRef.Create;
          ENLoadSwitchObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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

procedure TfrmENLoadSwitchEdit.spbMatDriveClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
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
              if ENLoadSwitchObj.matDriveRef = nil then
                ENLoadSwitchObj.matDriveRef := TKMaterialsRef.Create;
              ENLoadSwitchObj.matDriveRef.code :=
                TKMaterialsShort(tvDep.Selected.Data).code;
              edtMatDrive.Text := TKMaterialsShort(tvDep.Selected.Data).name;
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