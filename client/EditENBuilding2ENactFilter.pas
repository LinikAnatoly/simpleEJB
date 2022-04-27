
unit EditENBuilding2ENactFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBuilding2ENactController ;

type
  TfrmENBuilding2ENactFilterEdit = class(TDialogForm)

    lblSumGen : TLabel;
    edtSumGen: TEdit;

    lblSumNds : TLabel;
    edtSumNds: TEdit;

    lblIsCalculationDate : TLabel;
    edtIsCalculationDate: TEdit;

    lblFinContractNumber : TLabel;
    edtFinContractNumber: TEdit;

    lblFinContractDate : TLabel;
    edtFinContractDate: TDateTimePicker;
    lblPartnerName : TLabel;
    edtPartnerName: TEdit;

    lblPartnerCode : TLabel;
    edtPartnerCode: TEdit;

    lblIsActFromEnergyNET : TLabel;
    cbIsActFromEnergyNET: TComboBox;
    lblActNumber : TLabel;
    edtActNumber: TEdit;

    lblActDate : TLabel;
    edtActDate: TDateTimePicker;


  HTTPRIOENBuilding2ENact: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBuilding2ENactFilterEdit: TfrmENBuilding2ENactFilterEdit;
  ENBuilding2ENactFilterObj: ENBuilding2ENactFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBuilding2ENactController  ;
}
{$R *.dfm}



procedure TfrmENBuilding2ENactFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSumGen
      ,edtIsCalculationDate
      ,edtActDate
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENBuilding2ENactObj.sumGen <> nil ) then
       edtSumGen.Text := ENBuilding2ENactObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



    if ( ENBuilding2ENactObj.sumNds <> nil ) then
       edtSumNds.Text := ENBuilding2ENactObj.sumNds.decimalString
    else
       edtSumNds.Text := ''; 



    if ( ENBuilding2ENactObj.isCalculationDate <> Low(Integer) ) then
       edtIsCalculationDate.Text := IntToStr(ENBuilding2ENactObj.isCalculationDate)
    else
       edtIsCalculationDate.Text := '';



    edtFinContractNumber.Text := ENBuilding2ENactObj.finContractNumber; 



      if ENBuilding2ENactObj.finContractDate <> nil then
      begin
        edtFinContractDate.DateTime:=EncodeDate(ENBuilding2ENactObj.finContractDate.Year,ENBuilding2ENactObj.finContractDate.Month,ENBuilding2ENactObj.finContractDate.Day);
        edtFinContractDate.checked := true;
      end
      else
      begin
        edtFinContractDate.DateTime:=SysUtils.Date;
        edtFinContractDate.checked := false;
      end;



    edtPartnerName.Text := ENBuilding2ENactObj.partnerName; 



    edtPartnerCode.Text := ENBuilding2ENactObj.partnerCode; 



	  if ENBuilding2ENactObj.isActFromEnergyNET <> nil then begin
		if(ENBuilding2ENactObj.isActFromEnergyNET.asBoolean) then cbIsActFromEnergyNET.ItemIndex := 1
		else cbIsActFromEnergyNET.ItemIndex := 2;
	  end;



    edtActNumber.Text := ENBuilding2ENactObj.actNumber; 



      if ENBuilding2ENactObj.actDate <> nil then
      begin
        edtActDate.DateTime:=EncodeDate(ENBuilding2ENactObj.actDate.Year,ENBuilding2ENactObj.actDate.Month,ENBuilding2ENactObj.actDate.Day);
        edtActDate.checked := true;
      end
      else
      begin
        edtActDate.DateTime:=SysUtils.Date;
        edtActDate.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENBuilding2ENactFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENBuilding2ENactFilterObj.sumGen = nil ) then
       ENBuilding2ENactFilterObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       ENBuilding2ENactFilterObj.sumGen.decimalString := edtSumGen.Text 
     else
       ENBuilding2ENactFilterObj.sumGen := nil;




     if (ENBuilding2ENactFilterObj.sumNds = nil ) then
       ENBuilding2ENactFilterObj.sumNds := TXSDecimal.Create;
     if edtSumNds.Text <> '' then
       ENBuilding2ENactFilterObj.sumNds.decimalString := edtSumNds.Text 
     else
       ENBuilding2ENactFilterObj.sumNds := nil;




     if ( edtIsCalculationDate.Text <> '' ) then
       ENBuilding2ENactFilterObj.isCalculationDate := StrToInt(edtIsCalculationDate.Text)
     else
       ENBuilding2ENactFilterObj.isCalculationDate := Low(Integer) ;
	   



     ENBuilding2ENactFilterObj.finContractNumber := edtFinContractNumber.Text; 



     if edtfinContractDate.checked then
     begin 
       if ENBuilding2ENactFilterObj.finContractDate = nil then
          ENBuilding2ENactFilterObj.finContractDate := TXSDate.Create;
       ENBuilding2ENactFilterObj.finContractDate.XSToNative(GetXSDate(edtfinContractDate.DateTime));
     end
     else
       ENBuilding2ENactFilterObj.finContractDate := nil;



     ENBuilding2ENactFilterObj.partnerName := edtPartnerName.Text; 



     ENBuilding2ENactFilterObj.partnerCode := edtPartnerCode.Text; 



     if cbIsActFromEnergyNET.ItemIndex > 0 then
     begin 
       if ENBuilding2ENactFilterObj.isActFromEnergyNET = nil then ENBuilding2ENactFilterObj.isActFromEnergyNET := TXSBoolean.Create;
	   if cbIsActFromEnergyNET.ItemIndex = 1 then ENBuilding2ENactFilterObj.isActFromEnergyNET.asBoolean := true else ENBuilding2ENactFilterObj.isActFromEnergyNET.asBoolean := false;
     end
     else
       ENBuilding2ENactFilterObj.isActFromEnergyNET := nil;



     ENBuilding2ENactFilterObj.actNumber := edtActNumber.Text; 



     if edtactDate.checked then
     begin 
       if ENBuilding2ENactFilterObj.actDate = nil then
          ENBuilding2ENactFilterObj.actDate := TXSDateTime.Create;
       ENBuilding2ENactFilterObj.actDate.XSToNative(GetXSDate(edtactDate.DateTime));
     end
     else
       ENBuilding2ENactFilterObj.actDate := nil;




  end;
end;




end.