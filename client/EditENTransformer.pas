
unit EditENTransformer;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENTransformerController;

type
  TfrmENTransformerEdit = class(TDialogForm)

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblNominalPower : TLabel;
    edtNominalPower: TEdit;

  lblENTransformerTypeName : TLabel;
  edtENTransformerTypeName: TEdit;
  spbENTransformerType: TSpeedButton;
    lblENSubstation04Name: TLabel;
    edtENSubstation04Name: TEdit;
    spbENSubstation04: TSpeedButton;


  HTTPRIOENTransformer: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblMaterialsName: TLabel;
    lblBuhName: TLabel;
    edtBuhName: TEdit;
    edtMaterialsName: TEdit;
    HTTPRIOENSubstation04: THTTPRIO;
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    lblHighVoltage: TLabel;
    edtHighVoltage: TEdit;
    lblLowVoltage: TLabel;
    edtLowVoltage: TEdit;
    lblHighCurrent: TLabel;
    edtHighCurrent: TEdit;
    lblLowCurrent: TLabel;
    edtLowCurrent: TEdit;
    lblUkz: TLabel;
    edtUkz: TEdit;
    lblManufacturingdPlant: TLabel;
    edtManufacturingdPlant: TEdit;
    lblSerialNumber: TLabel;
    edtSerialNumber: TEdit;
    lblManufactureYear: TLabel;
    edtManufactureYear: TDateTimePicker;
    lblInstallDate: TLabel;
    edtInstallDate: TDateTimePicker;
    lblRemovalDate: TLabel;
    edtRemovalDate: TDateTimePicker;
    lblConnectGroup: TLabel;
    edtConnectGroup: TEdit;
    spbOSSelect: TSpeedButton;
    spbTkMaterials: TSpeedButton;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtDispName: TEdit;
    lblDispName: TLabel;
    gbAncapf: TGroupBox;
    rbAntsapf1: TRadioButton;
    rbAntsapf2: TRadioButton;
    rbAntsapf3: TRadioButton;
    rbAntsapfUnknown: TRadioButton;
    lblDpxx: TLabel;
    edtDpxx: TEdit;
    lblIxx: TLabel;
    lblDpkz: TLabel;
    edtDpkz: TEdit;
    edtIxx: TEdit;
    lblDefectDescription: TLabel;
    mmoDefectDescription: TMemo;
    cbbDefect: TComboBox;
    lblDefect: TLabel;
    lblDefectDate: TLabel;
    dtpDefectDate: TDateTimePicker;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTransformerTypeClick(Sender : TObject);
  procedure spbENSubstation04Click(Sender : TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure cbbDefectChange(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransformerEdit: TfrmENTransformerEdit;
  ENTransformerObj: ENTransformer;
  ENTransformerShortObj: ENTransformerShort;

implementation

uses
  ShowENTransformerType, ENTransformerTypeController, ShowENElement,
  ENElementController, ENSubstation04Controller, ShowOStable, OSTableController,
  ShowTKMaterials, TKMaterialsController, ENAntsapfController,
  ENTransformerDefectController;

{$R *.dfm}

procedure TfrmENTransformerEdit.FormShow(Sender: TObject);
var
  TempENSubstation04: ENSubstation04ControllerSoapPort;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  ENSubstation04Obj: ENSubstation04;
  //Spr_matherialObj: TKMaterials; //Исключено объявление не используемых переменных
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
begin
  FormatSettings.DecimalSeparator := '.';
  DisableControls([edtENSubstation04Name, spbENSubstation04,
    edtENTransformerTypeName, edtEPRenName, spbEPRen, edtMaterialsName]);
  SetFloatStyle([edtNominalPower, edtUkz, edtHighVoltage, edtLowVoltage,
    edtHighCurrent, edtLowCurrent, edtDpxx, edtIxx, edtDpkz]);
  if (DialogState = dsView) then
    DisableControls([spbENTransformerType, edtENTransformerTypeName,
      edtDpxx, edtIxx, edtDpkz, cbbDefect, mmoDefectDescription, dtpDefectDate]);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtMaterialsName, edtNominalPower, edtENTransformerTypeName
      ,edtNominalPower
      ,edtHighVoltage
      ,edtLowVoltage
      ,edtHighCurrent
      ,edtLowCurrent
      ,edtUkz
      ,edtDpxx
      ,edtIxx
      ,edtDpkz]);
  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtInvNumber.Text := ENTransformerObj.invNumber;
      if (ENTransformerObj.NominalPower <> nil) then
         edtNominalPower.Text := ENTransformerObj.NominalPower.DecimalString
      else
         edtNominalPower.Text := '';

      if ENTransformerObj.materialRef <> nil then
        begin
          if ENTransformerObj.materialRef.code <> Low(Integer) then
            begin
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
              Spr_matherialFilterObj := TKMaterialsFilter.Create;
              SetNullIntProps(Spr_matherialFilterObj);
              Spr_matherialFilterObj.code := ENTransformerObj.materialRef.code;
              Spr_matherialList :=
                TempSpr_matherial.getScrollableFilteredList(
                  Spr_matherialFilterObj, 0, -1);
              if (Spr_matherialList.totalCount > 0) then
                edtMaterialsName.Text := Spr_matherialList.list[0].name
              else
                edtMaterialsName.Text := '';
            end
        end;
      edtDispName.Text := ENTransformerObj.name;
      edtBuhName.Text := ENTransformerObj.buhName;
      edtENTransformerTypeName.Text := ENTransformerObj.TransformerType.name;
      //edtENElementName.Text := ENTransformerObj.element.name;

      TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
      ENSubstation04Obj := TempENSubstation04.getObject(ENTransformerObj.substation04Ref.code);
      edtENSubstation04Name.Text := ENSubstation04Obj.name;
      edtEPRenName.Text := ENSubstation04Obj.element.renRef.name;
      if ( ENTransformerObj.highVoltage <> nil ) then
        edtHighVoltage.Text := ENTransformerObj.highVoltage.decimalString
      else
        edtHighVoltage.Text := '';
      if ( ENTransformerObj.lowVoltage <> nil ) then
        edtLowVoltage.Text := ENTransformerObj.lowVoltage.decimalString
      else
        edtLowVoltage.Text := '';
      if ( ENTransformerObj.highCurrent <> nil ) then
        edtHighCurrent.Text := ENTransformerObj.highCurrent.decimalString
      else
        edtHighCurrent.Text := '';
      if ( ENTransformerObj.lowCurrent <> nil ) then
        edtLowCurrent.Text := ENTransformerObj.lowCurrent.decimalString
      else
        edtLowCurrent.Text := '';
      if ( ENTransformerObj.ukz <> nil ) then
        edtUkz.Text := ENTransformerObj.ukz.decimalString
      else
        edtUkz.Text := '';
      edtManufacturingdPlant.Text := ENTransformerObj.manufacturingdPlant;
      edtSerialNumber.Text := ENTransformerObj.serialNumber;
      if ENTransformerObj.manufactureYear <> nil then
        begin
          edtManufactureYear.DateTime:=EncodeDate(ENTransformerObj.manufactureYear.Year,ENTransformerObj.manufactureYear.Month,ENTransformerObj.manufactureYear.Day);
          edtManufactureYear.checked := true;
        end
      else
        begin
          edtManufactureYear.DateTime:=SysUtils.Date;
          edtManufactureYear.checked := false;
        end;
      if ENTransformerObj.installDate <> nil then
        begin
          edtInstallDate.DateTime:=EncodeDate(ENTransformerObj.installDate.Year,ENTransformerObj.installDate.Month,ENTransformerObj.installDate.Day);
          edtInstallDate.checked := true;
        end
      else
        begin
          edtInstallDate.DateTime:=SysUtils.Date;
          edtInstallDate.checked := false;
        end;
      if ENTransformerObj.removalDate <> nil then
        begin
          edtRemovalDate.DateTime:=EncodeDate(ENTransformerObj.removalDate.Year,ENTransformerObj.removalDate.Month,ENTransformerObj.removalDate.Day);
          edtRemovalDate.checked := true;
        end
      else
        begin
          edtRemovalDate.DateTime:=SysUtils.Date;
          edtRemovalDate.checked := false;
        end;
      edtConnectGroup.Text := ENTransformerObj.connectGroup;
      edtENTransformerTypeName.Text := ENTransformerObj.transformerType.name;

      if ENTransformerObj.antsapfRef = nil then
        rbAntsapfUnknown.Checked := true
      else if ENTransformerObj.antsapfRef.code = Low(Integer) then
        rbAntsapfUnknown.Checked := true
      else if ENTransformerObj.antsapfRef.code = 1 then
        rbAntsapf1.Checked := true
      else if ENTransformerObj.antsapfRef.code = 2 then
        rbAntsapf2.Checked := true
      else if ENTransformerObj.antsapfRef.code = 3 then
        rbAntsapf3.Checked := true;

      //OSB-3128
      if ( ENTransformerObj.dpxx <> nil ) then
         edtDpxx.Text := ENTransformerObj.dpxx.decimalString
      else
         edtDpxx.Text := '';
      if ( ENTransformerObj.ixx <> nil ) then
         edtIxx.Text := ENTransformerObj.ixx.decimalString
      else
         edtIxx.Text := '';
      if ( ENTransformerObj.dpkz <> nil ) then
         edtDpkz.Text := ENTransformerObj.dpkz.decimalString
      else
         edtDpkz.Text := '';

      cbbDefect.ItemIndex := 0;
      if ENTransformerObj.defectRef <> nil then
        if ENTransformerObj.defectRef.code <> Low(Integer) then
          cbbDefect.ItemIndex := ENTransformerObj.defectRef.code - 1;
      mmoDefectDescription.Text := ENTransformerObj.defectDescription;
      if ENTransformerObj.defectDate <> nil then
        begin
          dtpDefectDate.DateTime := EncodeDate(
            ENTransformerObj.defectDate.Year,
            ENTransformerObj.defectDate.Month,
            ENTransformerObj.defectDate.Day);
          dtpDefectDate.checked := true;
        end
      else
        begin
          dtpDefectDate.DateTime := SysUtils.Date;
          dtpDefectDate.checked := false;
        end;
      DisableControls([dtpDefectDate, mmoDefectDescription],
        ((cbbDefect.ItemIndex = 0) or (cbbDefect.ItemIndex = -1)));
    end;
end;

procedure TfrmENTransformerEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransformer: ENTransformerControllerSoapPort;
    TransformerFilter: ENTransformerFilter;
    TransformerList: ENTransformerShortList;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNominalPower
      ,edtHighVoltage
      ,edtLowVoltage
      ,edtHighCurrent
      ,edtLowCurrent
      ,edtUkz
      {,edtDpxx
      ,edtIxx
      ,edtDpkz}
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTransformer := HTTPRIOENTransformer as ENTransformerControllerSoapPort;

    ///////
    if DialogState = dsInsert then
      if (edtMaterialsName.Text <> '') and (edtInvNumber.Text <> '') then
      begin
        TransformerFilter := ENTransformerFilter.Create;
        try
          SetNullIntProps(TransformerFilter);
          SetNullXSProps(TransformerFilter);

          TransformerFilter.invNumber := edtInvNumber.Text;
          TransformerFilter.name := edtDispName.Text;

          TransformerList := TempENTransformer.getScrollableFilteredList(TransformerFilter, 0, -1);
          if TransformerList.totalCount > 0 then
          begin
            Application.MessageBox(
              PChar('Объект с таким именем и инвентарным номером уже существует (код: '
              + IntToStr(TransformerList.list[0].code) + ')!'),
              PChar('Внимание !'), MB_ICONWARNING+MB_OK);
            Action := caNone;
            Exit;
          end;
        finally
          TransformerFilter.Free;
        end;
      end;
    ///////

    ENTransformerObj.invNumber := edtInvNumber.Text;

    ENTransformerObj.buhName := edtBuhName.Text;

    if ENTransformerObj.materialRef <> nil then
    begin
      if ENTransformerObj.materialRef.code = low(Integer) then
        begin
          Application.MessageBox(PChar('Оберіть трансформатор!'),
            PChar('Увага!'), MB_ICONWARNING + MB_OK);
          if edtMaterialsName.CanFocus then
            edtMaterialsName.SetFocus;
          Action := caNone;
          Abort;
        end;
    end
    else
    begin
      Application.MessageBox(PChar('Оберіть трансформатор!'),
        PChar('Увага!'), MB_ICONWARNING + MB_OK);
      if edtMaterialsName.CanFocus then
        edtMaterialsName.SetFocus;
      Action := caNone;
      Abort;
    end;

    if (ENTransformerObj.nominalPower = nil ) then
     ENTransformerObj.nominalPower := TXSDecimal.Create;
    if edtNominalPower.Text <> '' then
     ENTransformerObj.nominalPower.decimalString := edtNominalPower.Text
    else
     ENTransformerObj.nominalPower := nil;

    if ENTransformerObj.transformerType <> nil then
     begin
       if ENTransformerObj.transformerType.code = low(Integer) then
         begin
           Application.MessageBox(PChar('Оберіть тип трансформатора !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
           if edtENTransformerTypeName.CanFocus then edtENTransformerTypeName.SetFocus;
             Action:=caNone;
           Abort;
         end;
     end
    else
     begin
       Application.MessageBox(PChar('Оберіть тип трансформатора !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
       if edtENTransformerTypeName.CanFocus then edtENTransformerTypeName.SetFocus;
         Action:=caNone;
       Abort;
     end;

    if (ENTransformerObj.highVoltage = nil ) then
     ENTransformerObj.highVoltage := TXSDecimal.Create;
    if edtHighVoltage.Text <> '' then
     ENTransformerObj.highVoltage.decimalString := edtHighVoltage.Text
    else
     ENTransformerObj.highVoltage := nil;

    if (ENTransformerObj.lowVoltage = nil ) then
     ENTransformerObj.lowVoltage := TXSDecimal.Create;
    if edtLowVoltage.Text <> '' then
     ENTransformerObj.lowVoltage.decimalString := edtLowVoltage.Text
    else
     ENTransformerObj.lowVoltage := nil;

    if (ENTransformerObj.highCurrent = nil ) then
     ENTransformerObj.highCurrent := TXSDecimal.Create;
    if edtHighCurrent.Text <> '' then
     ENTransformerObj.highCurrent.decimalString := edtHighCurrent.Text
    else
     ENTransformerObj.highCurrent := nil;

    if (ENTransformerObj.lowCurrent = nil ) then
     ENTransformerObj.lowCurrent := TXSDecimal.Create;
    if edtLowCurrent.Text <> '' then
     ENTransformerObj.lowCurrent.decimalString := edtLowCurrent.Text
    else
     ENTransformerObj.lowCurrent := nil;

    if (ENTransformerObj.ukz = nil ) then
     ENTransformerObj.ukz := TXSDecimal.Create;
    if edtUkz.Text <> '' then
     ENTransformerObj.ukz.DecimalString := edtUkz.Text
    else
     ENTransformerObj.ukz := nil;

    ENTransformerObj.manufacturingdPlant := edtManufacturingdPlant.Text;

    ENTransformerObj.serialNumber := edtSerialNumber.Text;

    if edtmanufactureYear.checked then
    begin
      if ENTransformerObj.manufactureYear = nil then
        ENTransformerObj.manufactureYear := TXSDate.Create;
      ENTransformerObj.manufactureYear.XSToNative(GetXSDate(edtmanufactureYear.DateTime));
    end
    else
      ENTransformerObj.manufactureYear := nil;

    if edtinstallDate.checked then
    begin
     if ENTransformerObj.installDate = nil then
       ENTransformerObj.installDate := TXSDate.Create;
      ENTransformerObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
    end
    else
      ENTransformerObj.installDate := nil;

    if edtremovalDate.checked then
    begin
     if ENTransformerObj.removalDate = nil then
        ENTransformerObj.removalDate := TXSDate.Create;
     ENTransformerObj.removalDate.XSToNative(GetXSDate(edtremovalDate.DateTime));
    end
    else
      ENTransformerObj.removalDate := nil;

    ENTransformerObj.connectGroup := edtConnectGroup.Text;
    ENTransformerObj.name := edtDispName.Text;

    if (rbAntsapf1.Checked) or (rbAntsapf2.Checked)
    or (rbAntsapf3.Checked) or (rbAntsapfUnknown.Checked) then
      begin
        if ENTransformerObj.antsapfRef = nil then
          ENTransformerObj.antsapfRef := ENAntsapfRef.Create;
        if rbAntsapf1.Checked then
          ENTransformerObj.antsapfRef.code := 1
        else if rbAntsapf2.Checked then
          ENTransformerObj.antsapfRef.code := 2
        else if rbAntsapf3.Checked then
          ENTransformerObj.antsapfRef.code := 3
        else if rbAntsapfUnknown.Checked then
          ENTransformerObj.antsapfRef.code := Low(Integer);
      end;

     if (ENTransformerObj.dpxx = nil ) then
       ENTransformerObj.dpxx := TXSDecimal.Create;
     if edtDpxx.Text <> '' then
       ENTransformerObj.dpxx.decimalString := edtDpxx.Text 
     else
       ENTransformerObj.dpxx := nil;

     if (ENTransformerObj.ixx = nil ) then
       ENTransformerObj.ixx := TXSDecimal.Create;
     if edtIxx.Text <> '' then
       ENTransformerObj.ixx.decimalString := edtIxx.Text 
     else
       ENTransformerObj.ixx := nil;

     if (ENTransformerObj.dpkz = nil ) then
       ENTransformerObj.dpkz := TXSDecimal.Create;
     if edtDpkz.Text <> '' then
       ENTransformerObj.dpkz.decimalString := edtDpkz.Text 
     else
       ENTransformerObj.dpkz := nil;

     ENTransformerObj.defectRef := ENTransformerDefectRef.Create;

     if cbbDefect.ItemIndex = -1 then
       ENTransformerObj.defectRef.code := Low(Integer)
     else
       ENTransformerObj.defectRef.code := cbbDefect.ItemIndex + 1;

     ENTransformerObj.defectDescription := mmoDefectDescription.Text;

     if dtpDefectDate.checked then
       begin
         if ENTransformerObj.defectDate = nil then
           ENTransformerObj.defectDate := TXSDate.Create;
         ENTransformerObj.defectDate.XSToNative(
           GetXSDate(dtpDefectDate.DateTime));
       end
     else
       ENTransformerObj.defectDate := nil;


    if DialogState = dsInsert then
    begin
      ENTransformerObj.code:=low(Integer);
      TempENTransformer.add(ENTransformerObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransformer.save(ENTransformerObj);
    end;
  end;
end;

procedure TfrmENTransformerEdit.spbENTransformerTypeClick(Sender : TObject);
var 
   frmENTransformerTypeShow: TfrmENTransformerTypeShow;
begin
   frmENTransformerTypeShow:=TfrmENTransformerTypeShow.Create(Application,fmNormal);
   try
      with frmENTransformerTypeShow do
        if ShowModal = mrOk then
        begin 
            try
               if ENTransformerObj.transformerType = nil then
                 ENTransformerObj.transformerType := ENTransformerType.Create();
               ENTransformerObj.transformerType.code := StrToInt(GetReturnValue(sgENTransformerType,0));
               edtENTransformerTypeName.Text:=GetReturnValue(sgENTransformerType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTransformerTypeShow.Free;
   end;
end;


procedure TfrmENTransformerEdit.spbENSubstation04Click(Sender : TObject);
//var frmENElementShow: TfrmENElementShow;
begin
{   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransformerObj.element = nil then ENTransformerObj.element := ENElement.Create();
               ENTransformerObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;}
end;



procedure TfrmENTransformerEdit.spbOSSelectClick(Sender: TObject);
var
frmOSTableShow: TfrmOSTableShow;
f : OStableFilter;
begin

     f := OStableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.conditionSQL := ' OSTABLE.KOD_PRIVAT in (1101) '; // Трансформаторы

     if length(edtInvNumber.Text) > 0 then
       f.kod_inv := '*' + edtInvNumber.Text + '*';

     f.orderBySQL :=  'OSTABLE.STR_NAME';

   frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);

   try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
            try
               //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
               edtInvNumber.Text := GetReturnValue(sgOSTable,2);
               edtBuhName.Text := GetReturnValue(sgOSTable,1);
               DisableControls([edtInvNumber, edtBuhName]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmOSTableShow.Free;
   end;
end;

procedure TfrmENTransformerEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENTransformerObj.materialRef = nil then
            ENTransformerObj.materialRef := TKMaterialsRef.Create;
          ENTransformerObj.materialRef.code :=
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

procedure TfrmENTransformerEdit.cbbDefectChange(Sender: TObject);
begin
  if (cbbDefect.ItemIndex = 0) or (cbbDefect.ItemIndex = -1) then
    begin
      dtpDefectDate.DateTime := SysUtils.Date;
      dtpDefectDate.checked := false;
      mmoDefectDescription.Text := '';
      DisableControls([dtpDefectDate, mmoDefectDescription]);
    end
  else
    begin
      DisableControls([dtpDefectDate, mmoDefectDescription], False);
      dtpDefectDate.checked := True;
    end;
end;

end.
