
unit EditENCoefficientQualityStandardsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCoefficientQualityStandardsController ;

type
  TfrmENCoefficientQualityStandardsFilterEdit = class(TDialogForm)

    lblSumma : TLabel;
    edtSumma: TEdit;

    lblCoefficient : TLabel;
    edtCoefficient: TEdit;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblFinPodrCode : TLabel;
    edtFinPodrCode: TEdit;

    lblAxOrgId : TLabel;
    edtAxOrgId: TEdit;



  HTTPRIOENCoefficientQualityStandards: THTTPRIO;

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
  frmENCoefficientQualityStandardsFilterEdit: TfrmENCoefficientQualityStandardsFilterEdit;
  ENCoefficientQualityStandardsFilterObj: ENCoefficientQualityStandardsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCoefficientQualityStandardsController  ;
}
{$R *.dfm}



procedure TfrmENCoefficientQualityStandardsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCoefficient
      ,edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENCoefficientQualityStandardsObj.summa <> nil ) then
       edtSumma.Text := ENCoefficientQualityStandardsObj.summa.decimalString
    else
       edtSumma.Text := ''; 



    if ( ENCoefficientQualityStandardsObj.coefficient <> nil ) then
       edtCoefficient.Text := ENCoefficientQualityStandardsObj.coefficient.decimalString
    else
       edtCoefficient.Text := ''; 



      if ENCoefficientQualityStandardsObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENCoefficientQualityStandardsObj.dateGen.Year,ENCoefficientQualityStandardsObj.dateGen.Month,ENCoefficientQualityStandardsObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;	  



    if ( ENCoefficientQualityStandardsObj.finPodrCode <> Low(Integer) ) then
       edtFinPodrCode.Text := IntToStr(ENCoefficientQualityStandardsObj.finPodrCode)
    else
       edtFinPodrCode.Text := '';



    edtAxOrgId.Text := ENCoefficientQualityStandardsObj.axOrgId; 


  end;

}

end;



procedure TfrmENCoefficientQualityStandardsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCoefficientQualityStandards: ENCoefficientQualityStandardsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENCoefficientQualityStandardsFilterObj.summa = nil ) then
       ENCoefficientQualityStandardsFilterObj.summa := TXSDecimal.Create;
     if edtSumma.Text <> '' then
       ENCoefficientQualityStandardsFilterObj.summa.decimalString := edtSumma.Text 
     else
       ENCoefficientQualityStandardsFilterObj.summa := nil;




     if (ENCoefficientQualityStandardsFilterObj.coefficient = nil ) then
       ENCoefficientQualityStandardsFilterObj.coefficient := TXSDecimal.Create;
     if edtCoefficient.Text <> '' then
       ENCoefficientQualityStandardsFilterObj.coefficient.decimalString := edtCoefficient.Text 
     else
       ENCoefficientQualityStandardsFilterObj.coefficient := nil;




     if edtdateGen.checked then
     begin 
       if ENCoefficientQualityStandardsFilterObj.dateGen = nil then
          ENCoefficientQualityStandardsFilterObj.dateGen := TXSDateTime.Create;
       ENCoefficientQualityStandardsFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENCoefficientQualityStandardsFilterObj.dateGen := nil;



     if ( edtFinPodrCode.Text <> '' ) then
       ENCoefficientQualityStandardsFilterObj.finPodrCode := StrToInt(edtFinPodrCode.Text)
     else
       ENCoefficientQualityStandardsFilterObj.finPodrCode := Low(Integer) ;
	   



     ENCoefficientQualityStandardsFilterObj.axOrgId := edtAxOrgId.Text; 




  end;
end;




end.