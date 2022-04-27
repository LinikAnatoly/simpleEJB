
unit EditENConnectionTariffFilter;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENConnectionTariffController ;

type
  TfrmENConnectionTariffFilterEdit = class(TDialogForm)


  lblENConnectionLevelLevelRefName : TLabel;
  edtENConnectionLevelLevelRefName : TEdit;
  spbENConnectionLevelLevelRef : TSpeedButton;
  
  lblENPowerReliabilityCategoryCategoryRefName : TLabel;
  edtENPowerReliabilityCategoryCategoryRefName : TEdit;
  spbENPowerReliabilityCategoryCategoryRef : TSpeedButton;
  
  lblENConnectionPowerPointPowerPointRefName : TLabel;
  edtENConnectionPowerPointPowerPointRefName : TEdit;
  spbENConnectionPowerPointPowerPointRef : TSpeedButton;
  
  lblENConnectionPhasityPhasityRefName : TLabel;
  edtENConnectionPhasityPhasityRefName : TEdit;
  spbENConnectionPhasityPhasityRef : TSpeedButton;
  

  HTTPRIOENConnectionTariff: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblTariffType: TLabel;
    edtTariffType: TEdit;
    spbTariffType: TSpeedButton;
    lblLineType: TLabel;
    edtLineType: TEdit;
    spbLineType: TSpeedButton;
    spbInstallationType: TSpeedButton;
    edtInstallationType: TEdit;
    lblInstallationType: TLabel;
    lblLocationType: TLabel;
    edtLocationType: TEdit;
    spbLocationType: TSpeedButton;
    spbDepartment: TSpeedButton;
    edtDepartment: TEdit;
    lblDepartment: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENConnectionLevelLevelRefClick(Sender : TObject);
  procedure spbENPowerReliabilityCategoryCategoryRefClick(Sender : TObject);
  procedure spbENConnectionPowerPointPowerPointRefClick(Sender : TObject);
  procedure spbENConnectionPhasityPhasityRefClick(Sender : TObject);
    procedure spbTariffTypeClick(Sender: TObject);
    procedure spbLineTypeClick(Sender: TObject);
    procedure spbInstallationTypeClick(Sender: TObject);
    procedure spbLocationTypeClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);

  private
    { Private declarations }
    isFiltered : Boolean;
  public
    { Public declarations }

end;

var
  frmENConnectionTariffFilterEdit: TfrmENConnectionTariffFilterEdit;
  ENConnectionTariffFilterObj: ENConnectionTariffFilter;

implementation

uses
  ShowENConnectionLevel
  ,ENConnectionLevelController
  ,ShowENPowerReliabilityCategory
  ,ENPowerReliabilityCategoryController
  ,ShowENConnectionPowerPoint
  ,ENConnectionPowerPointController
  ,ShowENConnectionPhasity
  ,ENConnectionPhasityController
, ShowENConnectionTariffType, ENConnectionTariffTypeController,
  ShowENConnectionLineType, ENConnectionLineTypeController,
  ShowENConnectionInstallationType, ENConnectionInstallationTypeController,
  EditENConnectionLocationType, ShowENConnectionLocationType,
  ENConnectionLocationTypeController, ENDepartmentController, ShowENDepartment;

{uses  
    EnergyproController, EnergyproController2, ENConnectionTariffController  ;
}
{$R *.dfm}



procedure TfrmENConnectionTariffFilterEdit.FormShow(Sender: TObject);
begin
  isFiltered := False;
  DisableControls([edtENConnectionLevelLevelRefName, edtENConnectionPowerPointPowerPointRefName,
    edtENPowerReliabilityCategoryCategoryRefName, edtENConnectionPhasityPhasityRefName]);
  DenyBlankValues([edtENConnectionLevelLevelRefName, edtENConnectionPowerPointPowerPointRefName,
    edtENPowerReliabilityCategoryCategoryRefName, edtENConnectionPhasityPhasityRefName]);
end;


procedure TfrmENConnectionTariffFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionTariff: ENConnectionTariffControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
    if not (isFiltered) then
    begin
      Application.MessageBox(PChar('¬ибер≥ть хоча б один критер≥й пошуку ...'), PChar('”вага'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;
  end;
end;


procedure TfrmENConnectionTariffFilterEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;

begin

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffFilterObj.departmentRef = nil
               then ENConnectionTariffFilterObj.departmentRef := ENDepartmentRef.Create();
               ENConnectionTariffFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
               isFiltered := True;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENConnectionTariffFilterEdit.spbENConnectionLevelLevelRefClick(Sender : TObject);
var 
  frmENConnectionLevelShow: TfrmENConnectionLevelShow;
begin
  frmENConnectionLevelShow:=TfrmENConnectionLevelShow.Create(Application,fmNormal);

  DisableActions([frmENConnectionLevelShow.actInsert, frmENConnectionLevelShow.actDelete,
       frmENConnectionLevelShow.actEdit]);

  try
    with frmENConnectionLevelShow do
    if ShowModal = mrOk then
    begin
      try
        if ENConnectionTariffFilterObj.levelRef = nil then ENConnectionTariffFilterObj.levelRef := ENConnectionLevelRef.Create();
          ENConnectionTariffFilterObj.levelRef.code := StrToInt(GetReturnValue(sgENConnectionLevel,0));
        edtENConnectionLevelLevelRefName.Text:=GetReturnValue(sgENConnectionLevel,1);

        isFiltered := True;
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENConnectionLevelShow.Free;
  end;
end;


procedure TfrmENConnectionTariffFilterEdit.spbENPowerReliabilityCategoryCategoryRefClick(Sender : TObject);
var 
  frmENPowerReliabilityCategoryShow: TfrmENPowerReliabilityCategoryShow;
begin
  frmENPowerReliabilityCategoryShow:=TfrmENPowerReliabilityCategoryShow.Create(Application,fmNormal);

  DisableActions([frmENPowerReliabilityCategoryShow.actInsert, frmENPowerReliabilityCategoryShow.actDelete,
    frmENPowerReliabilityCategoryShow.actEdit]);

  try
    with frmENPowerReliabilityCategoryShow do
    if ShowModal = mrOk then
    begin
      try
        if ENConnectionTariffFilterObj.categoryRef = nil then ENConnectionTariffFilterObj.categoryRef := ENPowerReliabilityCategoryRef.Create();
        ENConnectionTariffFilterObj.categoryRef.code := StrToInt(GetReturnValue(sgENPowerReliabilityCategory,0));
        edtENPowerReliabilityCategoryCategoryRefName.Text := GetReturnValue(sgENPowerReliabilityCategory,1) + ' - ' + GetReturnValue(sgENPowerReliabilityCategory,2);

        isFiltered := True;
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENPowerReliabilityCategoryShow.Free;
  end;
end;


procedure TfrmENConnectionTariffFilterEdit.spbInstallationTypeClick(
  Sender: TObject);
var
   frmENConnectionInstallationTypeShow: TfrmENConnectionInstallationTypeShow;
begin
   frmENConnectionInstallationTypeShow:=TfrmENConnectionInstallationTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionInstallationTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffFilterObj.installationTypeRef = nil then
               ENConnectionTariffFilterObj.installationTypeRef := ENConnectionInstallationTypeRef.Create();
               ENConnectionTariffFilterObj.installationTypeRef.code := StrToInt(GetReturnValue(sgENConnectionInstallationType,0));
               edtInstallationType.Text:=GetReturnValue(sgENConnectionInstallationType,1);

               isFiltered := True;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionInstallationTypeShow.Free;
   end;
end;

procedure TfrmENConnectionTariffFilterEdit.spbLineTypeClick(Sender: TObject);
var
   frmENConnectionLineTypeShow: TfrmENConnectionLineTypeShow;
begin
   frmENConnectionLineTypeShow:=TfrmENConnectionLineTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionLineTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffFilterObj.lineTypeRef = nil then
               ENConnectionTariffFilterObj.lineTypeRef := ENConnectionLineTypeRef.Create();
               ENConnectionTariffFilterObj.lineTypeRef.code := StrToInt(GetReturnValue(sgENConnectionLineType,0));
               edtLineType.Text:=GetReturnValue(sgENConnectionLineType,1);

               isFiltered := True;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionLineTypeShow.Free;
   end;
end;

procedure TfrmENConnectionTariffFilterEdit.spbLocationTypeClick(
  Sender: TObject);
var
   frmENConnectionLocationTypeShow: TfrmENConnectionLocationTypeShow;
begin
   frmENConnectionLocationTypeShow:=TfrmENConnectionLocationTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionLocationTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffFilterObj.locationTypeRef = nil then
               ENConnectionTariffFilterObj.locationTypeRef := ENConnectionLocationTypeRef.Create();
               ENConnectionTariffFilterObj.locationTypeRef.code := StrToInt(GetReturnValue(sgENConnectionLocationType,0));
               edtLocationType.Text:=GetReturnValue(sgENConnectionLocationType,1);
               isFiltered := True;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionLocationTypeShow.Free;
   end;
end;

procedure TfrmENConnectionTariffFilterEdit.spbTariffTypeClick(Sender: TObject);
var
   frmENConnectionTariffTypeShow: TfrmENConnectionTariffTypeShow;
begin
   frmENConnectionTariffTypeShow:=TfrmENConnectionTariffTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionTariffTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffFilterObj.tarifTypeRef = nil then
               ENConnectionTariffFilterObj.tarifTypeRef := ENConnectionTariffTypeRef.Create();
               ENConnectionTariffFilterObj.tarifTypeRef.code := StrToInt(GetReturnValue(sgENConnectionTariffType,0));
               edtTariffType.Text:=GetReturnValue(sgENConnectionTariffType,1);

              isFiltered := True;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionTariffTypeShow.Free;
   end;
end;

procedure TfrmENConnectionTariffFilterEdit.spbENConnectionPowerPointPowerPointRefClick(Sender : TObject);
var 
  frmENConnectionPowerPointShow: TfrmENConnectionPowerPointShow;
begin
  frmENConnectionPowerPointShow:=TfrmENConnectionPowerPointShow.Create(Application,fmNormal);

  DisableActions([frmENConnectionPowerPointShow.actInsert, frmENConnectionPowerPointShow.actDelete, frmENConnectionPowerPointShow.actEdit]);

  try
    with frmENConnectionPowerPointShow do
    if ShowModal = mrOk then
    begin
      try
        if ENConnectionTariffFilterObj.powerPointRef = nil then ENConnectionTariffFilterObj.powerPointRef := ENConnectionPowerPointRef.Create();
        ENConnectionTariffFilterObj.powerPointRef.code := StrToInt(GetReturnValue(sgENConnectionPowerPoint,0));
        edtENConnectionPowerPointPowerPointRefName.Text:=GetReturnValue(sgENConnectionPowerPoint,1);

        isFiltered := True;
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENConnectionPowerPointShow.Free;
  end;
end;


procedure TfrmENConnectionTariffFilterEdit.spbENConnectionPhasityPhasityRefClick(Sender : TObject);
var 
  frmENConnectionPhasityShow: TfrmENConnectionPhasityShow;
begin
  frmENConnectionPhasityShow:=TfrmENConnectionPhasityShow.Create(Application,fmNormal);

  DisableActions([frmENConnectionPhasityShow.actInsert, frmENConnectionPhasityShow.actDelete,
     frmENConnectionPhasityShow.actEdit]);

  try
    with frmENConnectionPhasityShow do
    if ShowModal = mrOk then
    begin
      try
        if ENConnectionTariffFilterObj.phasityRef = nil then ENConnectionTariffFilterObj.phasityRef := ENConnectionPhasityRef.Create();
        ENConnectionTariffFilterObj.phasityRef.code := StrToInt(GetReturnValue(sgENConnectionPhasity,0));
        edtENConnectionPhasityPhasityRefName.Text:=GetReturnValue(sgENConnectionPhasity,1);

        isFiltered := True;
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENConnectionPhasityShow.Free;
  end;
end;


end.