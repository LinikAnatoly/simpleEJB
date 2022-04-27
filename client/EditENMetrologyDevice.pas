
unit EditENMetrologyDevice;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMetrologyDeviceController ;

type
  TfrmENMetrologyDeviceEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblBuildNumber : TLabel;
    edtBuildNumber: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblENMetrologyDeviceTypeDeviceTypeName : TLabel;
  edtENMetrologyDeviceTypeDeviceTypeName : TEdit;
  spbENMetrologyDeviceTypeDeviceType : TSpeedButton;
  

  HTTPRIOENMetrologyDevice: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbOSSelect: TSpeedButton;
    gbObjectType: TGroupBox;
    rdbOS: TRadioButton;
    rdbMaterials: TRadioButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENMetrologyDeviceTypeDeviceTypeClick(Sender : TObject);
  procedure spbEPRenClick(Sender: TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENMetrologyDeviceEdit: TfrmENMetrologyDeviceEdit;
  ENMetrologyDeviceObj: ENMetrologyDevice;

implementation

uses
  ShowENMetrologyDeviceType
  ,ENMetrologyDeviceTypeController
, ShowENEPRen, ENElementController, ShowOStable, OSTableController,
  TMaterialController, ShowTKMaterials, ShowTMatherial,
  ShowENGeographicDepartment, ENGeographicDepartmentController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENMetrologyDeviceController  ;
}
{$R *.dfm}



procedure TfrmENMetrologyDeviceEdit.FormShow(Sender: TObject);
 var
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;

  eList : ENElementShortList;
  TempENElement: ENElementControllerSoapPort;
  eFilter : ENElementFilter;
begin

  DisableControls([edtEPRenName, edtENMetrologyDeviceTypeDeviceTypeName, edtBuhName , edtGeograph ]);

  if (DialogState = dsView) then
  DisableControls([btnGeograph , btnGeographClear]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtInvNumber,
      edtName,
      edtENMetrologyDeviceTypeDeviceTypeName,
      edtEPRenName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ENMetrologyDeviceObj.element.geoDepartmentRef <> nil then
      if ENMetrologyDeviceObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
           // geodept
          TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENMetrologyDeviceObj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;

    edtName.Text := ENMetrologyDeviceObj.name;
    edtBuildNumber.Text := ENMetrologyDeviceObj.buildNumber; 
    edtInvNumber.Text := ENMetrologyDeviceObj.invNumber; 
    edtBuhName.Text := ENMetrologyDeviceObj.buhName; 
    MakeMultiline(edtCommentGen.Lines, ENMetrologyDeviceObj.commentGen);

    edtENMetrologyDeviceTypeDeviceTypeName.Text := ENMetrologyDeviceObj.deviceType.name;

    edtEPRenName.Text := ENMetrologyDeviceObj.element.renRef.name;

    if ENMetrologyDeviceObj.element <> nil then
           if (ENMetrologyDeviceObj.element.renRef <> nil ) then
         begin
          TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
           eFilter := ENElementFilter.Create;
           SetNullIntProps(eFilter);
           SetNullXSProps(eFilter);
           eFilter.code := ENMetrologyDeviceObj.element.code;
          eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);
          edtEPRenName.Text :=  eList.list[0].renRefName;
         end
        else
          edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';

  end;
end;



procedure TfrmENMetrologyDeviceEdit.btnGeographClearClick(Sender: TObject);
begin
    ENMetrologyDeviceObj.element.geoDepartmentRef.code := LOW_INT;
    edtGeograph.Text := '';

end;

procedure TfrmENMetrologyDeviceEdit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 ENMetrologyDeviceObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENMetrologyDeviceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMetrologyDevice: ENMetrologyDeviceControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtInvNumber,
      edtName,
      edtENMetrologyDeviceTypeDeviceTypeName,
      edtEPRenName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENMetrologyDevice := HTTPRIOENMetrologyDevice as ENMetrologyDeviceControllerSoapPort;


     ENMetrologyDeviceObj.name := edtName.Text; 

     ENMetrologyDeviceObj.buildNumber := edtBuildNumber.Text; 

     ENMetrologyDeviceObj.invNumber := edtInvNumber.Text; 

     ENMetrologyDeviceObj.buhName := edtBuhName.Text; 

     ENMetrologyDeviceObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENMetrologyDeviceObj.code:=low(Integer);
      TempENMetrologyDevice.add(ENMetrologyDeviceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMetrologyDevice.save(ENMetrologyDeviceObj);
    end;
  end;
end;


procedure TfrmENMetrologyDeviceEdit.spbENMetrologyDeviceTypeDeviceTypeClick(Sender : TObject);
var 
   frmENMetrologyDeviceTypeShow: TfrmENMetrologyDeviceTypeShow;
begin
   frmENMetrologyDeviceTypeShow:=TfrmENMetrologyDeviceTypeShow.Create(Application,fmNormal);
   try
      with frmENMetrologyDeviceTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMetrologyDeviceObj.deviceType = nil then ENMetrologyDeviceObj.deviceType := ENMetrologyDeviceType.Create();
               ENMetrologyDeviceObj.deviceType.code := StrToInt(GetReturnValue(sgENMetrologyDeviceType,0));
               edtENMetrologyDeviceTypeDeviceTypeName.Text:=GetReturnValue(sgENMetrologyDeviceType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENMetrologyDeviceTypeShow.Free;
   end;
end;



procedure TfrmENMetrologyDeviceEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMetrologyDeviceObj.element = nil then ENMetrologyDeviceObj.element := ENElement.Create();
               if ENMetrologyDeviceObj.element.renRef = nil then ENMetrologyDeviceObj.element.renRef := EPRenRef.Create();
               ENMetrologyDeviceObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

procedure TfrmENMetrologyDeviceEdit.spbOSSelectClick(Sender: TObject);
var
  frmOSTableShow: TfrmOSTableShow;
  f: OStableFilter;

  frmTMatherialShow: TfrmTMatherialShow;
  fMaterial: TMaterialFilter;
begin
  if rdbOS.Checked then // Выбор из основных
  begin
    f := OStableFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.conditionSQL := ' OSTABLE.KOD_VID in (1, 2, 3, 11, 13, 15, 24, 38) '; // подстанции как СИЛ.МАШИНЫ И ОБОРУД НЕ АВТОМ (11) ...

    if length(edtInvNumber.Text) > 0 then
      f.kod_inv := '*' + edtInvNumber.Text + '*';

    f.orderBySQL :=  'OSTABLE.STR_NAME';

    frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
    //frmOSTableShow.SendType := 444; /// для энерго ....
    try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
          try
            //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
            edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
            edtBuhName.Text := GetReturnValue(sgOSTable,1);
            DisableControls([edtInvNumber, edtBuhName]);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmOSTableShow.Free;
    end;
  end
  else begin // Выбор из материалов
    fMaterial := TMaterialFilter.Create;
    SetNullIntProps(fMaterial);
    SetNullXSProps(fMaterial);

    if length(edtInvNumber.Text) > 0 then
      fMaterial.nn := '*' + edtInvNumber.Text + '*';
    fMaterial.conditionSQL := 'TMATHERIAL.STATUS = ''A''';
    fMaterial.orderBySQL :=  'TMATHERIAL.NAME';

    frmTMatherialShow := TfrmTMatherialShow.Create(Application, fmNormal, fMaterial);
    try
      with frmTMatherialShow do
        if ShowModal = mrOk then
        begin
          try
            edtInvNumber.Text := GetReturnValue(sgTMatherial,3);
            edtBuhName.Text := GetReturnValue(sgTMatherial,1);
            DisableControls([edtInvNumber, edtBuhName]);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmTMatherialShow.Free;
    end;
  end;
end;

end.
