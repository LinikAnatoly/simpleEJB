
unit EditENBuildingFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBuildingController ;

type
  TfrmENBuildingFilterEdit = class(TDialogForm)

    lblNumbergen : TLabel;
    edtNumbergen: TEdit;

    lblDateGen : TLabel;
    edtDateGenFrom: TDateTimePicker;

    lblNameOZ : TLabel;
    edtNameOZ: TMemo;

  btnOk: TButton;
  btnCancel: TButton;
    lblStatusName: TLabel;
    edtStatusName: TEdit;
    btnStatus: TSpeedButton;
    HTTPRIOENBuildingStatus: THTTPRIO;
    Label3: TLabel;
    edtInvNumberOZ: TEdit;
    spbDepartment: TSpeedButton;
    edtDepartment: TEdit;
    lblDepartment: TLabel;
    Label1: TLabel;
    edtDateGenTo: TDateTimePicker;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnStatusClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBuildingFilterEdit: TfrmENBuildingFilterEdit;
  ENBuildingFilterObj: ENBuildingFilter;

implementation

uses ENBuildingStatusController, ShowENBuildingStatus, ShowENDepartment,
  ENDepartmentController;


{uses  
    EnergyproController, EnergyproController2, ENBuildingController  ;
}
{$R *.dfm}



procedure TfrmENBuildingFilterEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtStatusName , edtDepartment]);
{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumbergen
      ,edtIsInvestProgram
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumbergen.Text := ENBuildingObj.numbergen; 



      if ENBuildingObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENBuildingObj.dateGen.Year,ENBuildingObj.dateGen.Month,ENBuildingObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



      if ENBuildingObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENBuildingObj.dateEdit.Year,ENBuildingObj.dateEdit.Month,ENBuildingObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;



    if ( ENBuildingObj.summaGen <> nil ) then
       edtSummaGen.Text := ENBuildingObj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 



    if ( ENBuildingObj.summaNDS <> nil ) then
       edtSummaNDS.Text := ENBuildingObj.summaNDS.decimalString
    else
       edtSummaNDS.Text := ''; 



    MakeMultiline(edtCharacteristic.Lines, ENBuildingObj.characteristic);



    edtExecutedPosition.Text := ENBuildingObj.executedPosition; 



    edtExecutedName.Text := ENBuildingObj.executedName; 



    edtAcceptedPosition.Text := ENBuildingObj.acceptedPosition; 



    edtAcceptedName.Text := ENBuildingObj.acceptedName; 



    if ( ENBuildingObj.contractPrice <> nil ) then
       edtContractPrice.Text := ENBuildingObj.contractPrice.decimalString
    else
       edtContractPrice.Text := ''; 



    edtCodeMol.Text := ENBuildingObj.codeMol; 



    edtCodePodr.Text := ENBuildingObj.codePodr; 



    edtInvNumberOZ.Text := ENBuildingObj.invNumberOZ; 



    MakeMultiline(edtNameOZ.Lines, ENBuildingObj.nameOZ);



    edtFinContractNumber.Text := ENBuildingObj.finContractNumber; 



      if ENBuildingObj.finContractDate <> nil then
      begin
        edtFinContractDate.DateTime:=EncodeDate(ENBuildingObj.finContractDate.Year,ENBuildingObj.finContractDate.Month,ENBuildingObj.finContractDate.Day);
        edtFinContractDate.checked := true;
      end
      else
      begin
        edtFinContractDate.DateTime:=SysUtils.Date;
        edtFinContractDate.checked := false;
      end;



    edtPartnerName.Text := ENBuildingObj.partnerName; 



    edtPartnerCode.Text := ENBuildingObj.partnerCode; 



    MakeMultiline(edtCharacteristicOS.Lines, ENBuildingObj.characteristicOS);



    if ( ENBuildingObj.isInvestProgram <> Low(Integer) ) then
       edtIsInvestProgram.Text := IntToStr(ENBuildingObj.isInvestProgram)
    else
       edtIsInvestProgram.Text := '';



    edtYearInvestProgram.Text := ENBuildingObj.yearInvestProgram; 



    edtItemInvestProgram.Text := ENBuildingObj.itemInvestProgram; 



    edtUserGen.Text := ENBuildingObj.userGen; 


  end;

}

end;



procedure TfrmENBuildingFilterEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin
            try
               if ENBuildingFilterObj.departmentRef= nil then ENBuildingFilterObj.departmentRef := ENDepartmentRef.Create();
               ENBuildingFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
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

procedure TfrmENBuildingFilterEdit.btnStatusClick(Sender: TObject);
var
   frmENBuildingStatusShow: TfrmENBuildingStatusShow;
   TempENBuildingStatus: ENBuildingStatusControllerSoapPort;
begin
   frmENBuildingStatusShow:= TfrmENBuildingStatusShow.Create(Application,fmNormal);
   DisableActions([frmENBuildingStatusShow.actView , frmENBuildingStatusShow.actInsert ,
                    frmENBuildingStatusShow.actDelete ,
                    frmENBuildingStatusShow.actEdit ,
                    frmENBuildingStatusShow.actUpdate,
                    frmENBuildingStatusShow.actFilter,
                    frmENBuildingStatusShow.actNoFilter] );
   try
      with frmENBuildingStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBuildingFilterObj.statusRef = nil then
                  ENBuildingFilterObj.statusRef := ENBuildingStatusRef.Create;

                  ENBuildingFilterObj.statusRef.code := StrToInt(GetReturnValue(sgENBuildingStatus,0));
               edtStatusName.Text:=GetReturnValue(sgENBuildingStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENBuildingStatusShow.Free;
   end;
end;

procedure TfrmENBuildingFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilding: ENBuildingControllerSoapPort;
condition : String;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBuildingFilterObj.numbergen := edtNumbergen.Text;



     {if edtdateGen.checked then
     begin
       if ENBuildingFilterObj.dateGen = nil then
          ENBuildingFilterObj.dateGen := TXSDate.Create;
       ENBuildingFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENBuildingFilterObj.dateGen := nil;  }

      condition:= '';
      if edtdateGenFrom.checked then
        AddCondition(condition, 'enbuilding.dategen >= to_date(''' + DateToStr(edtDateGenFrom.Date) + ''', ''dd.MM.yyyy'')');



     if edtDateGenTo.checked then
        AddCondition(condition, 'enbuilding.dategen <= to_date(''' + DateToStr(edtDateGenTo.Date) + ''', ''dd.MM.yyyy'')');




     if (ENBuildingFilterObj.contractPrice = nil ) then
       ENBuildingFilterObj.contractPrice := TXSDecimal.Create;
     

     ENBuildingFilterObj.nameOZ := edtNameOZ.Text; 

     ENBuildingFilterObj.invNumberOZ := edtInvNumberOZ.Text;
     ENBuildingFilterObj.conditionSQL := condition;

  end;
end;




end.