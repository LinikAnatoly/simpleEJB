
unit EditTKTransportRealFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, TKTransportRealController ;

type
  TfrmTKTransportRealFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblGosNumber : TLabel;
    edtGosNumber: TEdit;

  lblTKTransportTransportName : TLabel;
  edtTKTransportTransportName : TEdit;
  spbTKTransportTransport : TSpeedButton;
  
  lblTKTransportMarkTransportmarkName : TLabel;
  edtTKTransportMarkTransportmarkName : TEdit;
  spbTKTransportMarkTransportmark : TSpeedButton;
  
  lblOSTableFinName : TLabel;
  edtOSTableFinName : TEdit;
  spbOSTableFin : TSpeedButton;
  
  lblTKTransportStatusTransportstatusName : TLabel;
  edtTKTransportStatusTransportstatusName : TEdit;
  spbTKTransportStatusTransportstatus : TSpeedButton;
  

  HTTPRIOTKTransportReal: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    lblTransportDepartment: TLabel;
    edtENTransportDepartmentName: TEdit;
    spbENTransportDepartment: TSpeedButton;
    edtRegId: TEdit;
    lblRegId: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportTransportClick(Sender : TObject);
  procedure spbTKTransportMarkTransportmarkClick(Sender : TObject);
  procedure spbOSTableFinClick(Sender : TObject);
  procedure spbTKTransportStatusTransportstatusClick(Sender : TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbENTransportDepartmentClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmTKTransportRealFilterEdit: TfrmTKTransportRealFilterEdit;
  TKTransportRealFilterObj: TKTransportRealFilter;

implementation

uses
  ShowTKTransport
  ,TKTransportController
  ,ShowTKTransportMark
  ,TKTransportMarkController
  ,ShowOSTable
  ,OSTableController
  ,ShowTKTransportStatus
  ,TKTransportStatusController
, ShowENDepartment, ENDepartmentController, ShowENTransportDepartment, 
  ENTransportDepartmentController;

{uses  
    EnergyproController, EnergyproController2, TKTransportRealController  ;
}
{$R *.dfm}



procedure TfrmTKTransportRealFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtInvNumber
      ,edtGosNumber
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := TKTransportRealObj.name;
    edtInvNumber.Text := TKTransportRealObj.invNumber;
    edtGosNumber.Text := TKTransportRealObj.gosNumber;
  end;
}

DisableControls([edtTKTransportMarkTransportmarkName , edtDepartment , edtENTransportDepartmentName]);

end;



procedure TfrmTKTransportRealFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempTKTransportReal: TKTransportRealControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
     TKTransportRealFilterObj.name := edtName.Text;
     TKTransportRealFilterObj.invNumber := edtInvNumber.Text;
     TKTransportRealFilterObj.gosNumber := edtGosNumber.Text;
     if Length(edtRegId.Text) > 0 then begin
          TKTransportRealFilterObj.reg_id := StrToInt(edtRegId.Text);
     end;

  end;
end;

procedure TfrmTKTransportRealFilterEdit.spbTKTransportTransportClick(Sender : TObject);
var 
   frmTKTransportShow: TfrmTKTransportShow;
begin
   frmTKTransportShow:=TfrmTKTransportShow.Create(Application,fmNormal);
   try
      with frmTKTransportShow do
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealFilterObj.transport = nil then TKTransportRealFilterObj.transport := TKTransport.Create();
               TKTransportRealFilterObj.transport.code := StrToInt(GetReturnValue(sgTKTransport,0));
               edtTKTransportTransportName.Text:=GetReturnValue(sgTKTransport,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportShow.Free;
   end;
end;


procedure TfrmTKTransportRealFilterEdit.spbTKTransportMarkTransportmarkClick(Sender : TObject);
var 
   frmTKTransportMarkShow: TfrmTKTransportMarkShow;
begin
   frmTKTransportMarkShow:=TfrmTKTransportMarkShow.Create(Application,fmNormal);
   try
      with frmTKTransportMarkShow do
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealFilterObj.transportmark = nil then TKTransportRealFilterObj.transportmark := TKTransportMark.Create();
               TKTransportRealFilterObj.transportmark.code := StrToInt(GetReturnValue(sgTKTransportMark,0));
               edtTKTransportMarkTransportmarkName.Text:=GetReturnValue(sgTKTransportMark,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportMarkShow.Free;
   end;
end;


procedure TfrmTKTransportRealFilterEdit.spbOSTableFinClick(Sender : TObject);
var 
   frmOSTableShow: TfrmOSTableShow;
begin
  {
   frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal);
 frmOSTableShow.SendType:=3;
   try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealFilterObj.fin = nil then TKTransportRealFilterObj.fin := OSTable.Create();
               TKTransportRealFilterObj.fin.num_un:= StrToInt(GetReturnValue(sgOSTable,0));
               edtOSTableFinName.Text:=GetReturnValue(sgOSTable,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmOSTableShow.Free;
   end;
   }
end;


procedure TfrmTKTransportRealFilterEdit.spbTKTransportStatusTransportstatusClick(Sender : TObject);
var 
   frmTKTransportStatusShow: TfrmTKTransportStatusShow;
begin
   frmTKTransportStatusShow:=TfrmTKTransportStatusShow.Create(Application,fmNormal);
   try
      with frmTKTransportStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if TKTransportRealFilterObj.transportstatus = nil then TKTransportRealFilterObj.transportstatus := TKTransportStatus.Create();
               TKTransportRealFilterObj.transportstatus.code := StrToInt(GetReturnValue(sgTKTransportStatus,0));
               edtTKTransportStatusTransportstatusName.Text:=GetReturnValue(sgTKTransportStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportStatusShow.Free;
   end;
end;





procedure TfrmTKTransportRealFilterEdit.spbDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   TempENDepartment: ENDepartmentControllerSoapPort;
   depCodes : String;

begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   {
   f.code := 1;
   if ENPlanWorkFilterObj.elementRef <> nil then
      if ENPlanWorkFilterObj.elementRef.code > low(Integer) then
         if ENPlanWorkFilterObj.renRef <> nil then
            if ENPlanWorkFilterObj.renRef.code > low(Integer) then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkFilterObj.renRef.code) +')';
               f.code := Low(integer);
            end;

   }



   f.code := 1;


   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               TempENDepartment := Self.HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

               depCodes := TempENDepartment.getDepartmentCodesDown(ENDepartmentShort(tvDep.Selected.Data).code);

               {
               if TKTransportRealFilterObj.departmentRef = nil then TKTransportRealFilterObj.departmentRef := ENDepartmentRef.Create();
               TKTransportRealFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               }

               //if depCodes <> '' then
               if length(TKTransportRealFilterObj.conditionSQL) > 0 then
                  TKTransportRealFilterObj.conditionSQL := TKTransportRealFilterObj.conditionSQL + ' and departmentrefcode in (' + depCodes + ')'
               else
                  TKTransportRealFilterObj.conditionSQL := ' departmentrefcode in (' + depCodes + ')' ;

               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmTKTransportRealFilterEdit.spbENTransportDepartmentClick(
  Sender: TObject);
 var
   frmENTransportDepartmentShow: TfrmENTransportDepartmentShow;
   f : ENTransportDepartmentFilter;
begin
   f := ENTransportDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
              // if TKTransportRealFilterObj.transportDepartmentRef = nil then TKTransportRealFilterObj.transportDepartmentRef := ENTransportDepartmentRef.Create();
              // TKTransportRealFilterObj.transportDepartmentRef.code := StrToInt(GetReturnValue(sgENTransportDepartment,0));

               if length(TKTransportRealFilterObj.conditionSQL) > 0 then
                  TKTransportRealFilterObj.conditionSQL := TKTransportRealFilterObj.conditionSQL + ' and TKTRANSPORTREAL.transportdepartmntrfcd = ' + GetReturnValue(sgENTransportDepartment,0)
               else
                  TKTransportRealFilterObj.conditionSQL := ' TKTRANSPORTREAL.transportdepartmntrfcd = ' + GetReturnValue(sgENTransportDepartment,0) ;

               edtENTransportDepartmentName.Text:= GetReturnValue(sgENTransportDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;                   
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;

end;
end.