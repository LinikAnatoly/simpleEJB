
unit EditENCoefficientExecPlanFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCoefficientExecPlanController ;

type
  TfrmENCoefficientExecPlanFilterEdit = class(TDialogForm)

    lblCoefficient : TLabel;
    edtCoefficient: TEdit;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblFinPodrCode : TLabel;
    edtFinPodrCode: TEdit;



  HTTPRIOENCoefficientExecPlan: THTTPRIO;

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
  frmENCoefficientExecPlanFilterEdit: TfrmENCoefficientExecPlanFilterEdit;
  ENCoefficientExecPlanFilterObj: ENCoefficientExecPlanFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCoefficientExecPlanController  ;
}
{$R *.dfm}



procedure TfrmENCoefficientExecPlanFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCoefficient
      ,edtDateGen
      ,edtFinPodrCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENCoefficientExecPlanObj.coefficient <> nil ) then
       edtCoefficient.Text := ENCoefficientExecPlanObj.coefficient.decimalString
    else
       edtCoefficient.Text := ''; 



      if ENCoefficientExecPlanObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENCoefficientExecPlanObj.dateGen.Year,ENCoefficientExecPlanObj.dateGen.Month,ENCoefficientExecPlanObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;	  



    if ( ENCoefficientExecPlanObj.finPodrCode <> Low(Integer) ) then
       edtFinPodrCode.Text := IntToStr(ENCoefficientExecPlanObj.finPodrCode)
    else
       edtFinPodrCode.Text := '';


  end;

}

end;



procedure TfrmENCoefficientExecPlanFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCoefficientExecPlan: ENCoefficientExecPlanControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENCoefficientExecPlanFilterObj.coefficient = nil ) then
       ENCoefficientExecPlanFilterObj.coefficient := TXSDecimal.Create;
     if edtCoefficient.Text <> '' then
       ENCoefficientExecPlanFilterObj.coefficient.decimalString := edtCoefficient.Text 
     else
       ENCoefficientExecPlanFilterObj.coefficient := nil;




     if edtdateGen.checked then
     begin 
       if ENCoefficientExecPlanFilterObj.dateGen = nil then
          ENCoefficientExecPlanFilterObj.dateGen := TXSDateTime.Create;
       ENCoefficientExecPlanFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENCoefficientExecPlanFilterObj.dateGen := nil;



     if ( edtFinPodrCode.Text <> '' ) then
       ENCoefficientExecPlanFilterObj.finPodrCode := StrToInt(edtFinPodrCode.Text)
     else
       ENCoefficientExecPlanFilterObj.finPodrCode := Low(Integer) ;





  end;
end;




end.