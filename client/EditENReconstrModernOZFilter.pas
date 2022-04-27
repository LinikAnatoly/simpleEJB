
unit EditENReconstrModernOZFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENReconstrModernOZController ;

type
  TfrmENReconstrModernOZFilterEdit = class(TDialogForm)

    lblNumbergen : TLabel;
    edtNumbergen: TEdit;

    lblDateGen : TLabel;
    edtDateGenFrom: TDateTimePicker;



  HTTPRIOENReconstrModernOZ: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    Label1: TLabel;
    edtDateGenTo: TDateTimePicker;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    lblStatusName: TLabel;
    edtStatusName: TEdit;
    btnStatus: TSpeedButton;
    HTTPRIOENReconstrModernOZStatus: THTTPRIO;
    edtInvNumberOZ: TEdit;
    Label3: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbDepartmentClick(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENReconstrModernOZFilterEdit: TfrmENReconstrModernOZFilterEdit;
  ENReconstrModernOZFilterObj: ENReconstrModernOZFilter;

implementation

uses ShowENDepartment, ENDepartmentController 
  , ENReconstrModernOZStatusController, ShowENReconstrModernOZStatus;


{uses  
    EnergyproController, EnergyproController2, ENReconstrModernOZController  ;
}
{$R *.dfm}



procedure TfrmENReconstrModernOZFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumbergen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumbergen.Text := ENReconstrModernOZObj.numbergen; 



      if ENReconstrModernOZObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENReconstrModernOZObj.dateGen.Year,ENReconstrModernOZObj.dateGen.Month,ENReconstrModernOZObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



      if ENReconstrModernOZObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENReconstrModernOZObj.dateEdit.Year,ENReconstrModernOZObj.dateEdit.Month,ENReconstrModernOZObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;



    if ( ENReconstrModernOZObj.summaGen <> nil ) then
       edtSummaGen.Text := ENReconstrModernOZObj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 



    MakeMultiline(edtCharacteristic.Lines, ENReconstrModernOZObj.characteristic);



    edtExecutedPosition.Text := ENReconstrModernOZObj.executedPosition; 



    edtExecutedName.Text := ENReconstrModernOZObj.executedName; 



    edtAcceptedPosition.Text := ENReconstrModernOZObj.acceptedPosition; 



    edtAcceptedName.Text := ENReconstrModernOZObj.acceptedName; 



    if ( ENReconstrModernOZObj.contractPrice <> nil ) then
       edtContractPrice.Text := ENReconstrModernOZObj.contractPrice.decimalString
    else
       edtContractPrice.Text := ''; 



    edtCodeMol.Text := ENReconstrModernOZObj.codeMol; 



    edtCodePodr.Text := ENReconstrModernOZObj.codePodr; 



    edtUserGen.Text := ENReconstrModernOZObj.userGen; 


  end;

}

end;



procedure TfrmENReconstrModernOZFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
condition : String;
begin
  if (ModalResult = mrOk)  then
  begin

    { ENReconstrModernOZFilterObj.numbergen := edtNumbergen.Text;



     if edtdateGenFrom.checked then
     begin 
       if ENReconstrModernOZFilterObj.dateGen = nil then
          ENReconstrModernOZFilterObj.dateGen := TXSDate.Create;
       ENReconstrModernOZFilterObj.dateGen.XSToNative(GetXSDate(edtdateGenFrom.DateTime));
     end
     else
       ENReconstrModernOZFilterObj.dateGen := nil;

     if (ENReconstrModernOZFilterObj.summaGen = nil ) then
       ENReconstrModernOZFilterObj.summaGen := TXSDecimal.Create;

     if (ENReconstrModernOZFilterObj.contractPrice = nil ) then
       ENReconstrModernOZFilterObj.contractPrice := TXSDecimal.Create;

       }

       ENReconstrModernOZFilterObj.numbergen := edtNumbergen.Text; 
     condition:= '';



     if edtdateGenFrom.checked then
        AddCondition(condition, 'enreconstrmodernoz.dategen >= to_date(''' + DateToStr(edtDateGenFrom.Date) + ''', ''dd.MM.yyyy'')');



     if edtDateGenTo.checked then
        AddCondition(condition, 'enreconstrmodernoz.dategen <= to_date(''' + DateToStr(edtDateGenTo.Date) + ''', ''dd.MM.yyyy'')');




       ENReconstrModernOZFilterObj.dateEdit := nil;




       ENReconstrModernOZFilterObj.summaGen := nil;




       ENReconstrModernOZFilterObj.summaNDS := nil;




      ENReconstrModernOZFilterObj.characteristic := '';



     ENReconstrModernOZFilterObj.executedPosition := '';



     ENReconstrModernOZFilterObj.executedName := '';



     ENReconstrModernOZFilterObj.acceptedPosition := ''; 



     ENReconstrModernOZFilterObj.acceptedName := ''; 



   
       ENReconstrModernOZFilterObj.contractPrice := nil;




     ENReconstrModernOZFilterObj.codeMol := ''; 



     ENReconstrModernOZFilterObj.codePodr := ''; 



     ENReconstrModernOZFilterObj.invNumberOZ := edtInvNumberOZ.Text;



     ENReconstrModernOZFilterObj.nameOZ := ''; 



     ENReconstrModernOZFilterObj.finContractNumber := ''; 




     ENReconstrModernOZFilterObj.finContractDate := nil;



     ENReconstrModernOZFilterObj.partnerName := ''; 



     ENReconstrModernOZFilterObj.partnerCode := '';



    // ENReconstrModernOZFilterObj.characteristicOS := ''; 



     ENReconstrModernOZFilterObj.userGen := '';
     ENReconstrModernOZFilterObj.conditionSQL := condition;

  end;
end;




procedure TfrmENReconstrModernOZFilterEdit.spbDepartmentClick(
  Sender: TObject);
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
               if ENReconstrModernOZFilterObj.departmentRef= nil then ENReconstrModernOZFilterObj.departmentRef := ENDepartmentRef.Create();
               ENReconstrModernOZFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
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

procedure TfrmENReconstrModernOZFilterEdit.btnStatusClick(Sender: TObject);
var
   frmENReconstrModernOZStatusShow: TfrmENReconstrModernOZStatusShow;
   TempENReconstrModernOZStatus: ENReconstrModernOZStatusControllerSoapPort;
begin
   frmENReconstrModernOZStatusShow:= TfrmENReconstrModernOZStatusShow.Create(Application,fmNormal);
   DisableActions([frmENReconstrModernOZStatusShow.actView , frmENReconstrModernOZStatusShow.actInsert ,
                    frmENReconstrModernOZStatusShow.actDelete ,
                    frmENReconstrModernOZStatusShow.actEdit ,
                    frmENReconstrModernOZStatusShow.actUpdate,
                    frmENReconstrModernOZStatusShow.actFilter,
                    frmENReconstrModernOZStatusShow.actNoFilter] );
   try
      with frmENReconstrModernOZStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENReconstrModernOZFilterObj.statusRef = nil then
               ENReconstrModernOZFilterObj.statusRef := ENReconstrModernOZStatusRef.Create ;

               ENReconstrModernOZFilterObj.statusRef.code := StrToInt(GetReturnValue(sgENReconstrModernOZStatus,0));
               edtStatusName.Text:=GetReturnValue(sgENReconstrModernOZStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENReconstrModernOZStatusShow.Free;
   end;
end;

end.