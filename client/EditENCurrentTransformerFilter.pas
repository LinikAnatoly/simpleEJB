
unit EditENCurrentTransformerFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCurrentTransformerController ;

type
  TfrmENCurrentTransformerFilterEdit = class(TDialogForm)

    lblAccruracyClass : TLabel;
    edtAccruracyClass: TEdit;

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblCoefTransformation : TLabel;
    edtCoefTransformation: TEdit;

    lblSecondaryWindingsNumber : TLabel;
    edtSecondaryWindingsNumber: TEdit;
    lblENCurrentTransformerTypeName: TLabel;
    edtENCurrentTransformerTypeName: TEdit;
    spbENCurrentTransformerType: TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENHighVoltageSellHighvoltageSellName : TLabel;
  edtENHighVoltageSellHighvoltageSellName : TEdit;
  spbENHighVoltageSellHighvoltageSell : TSpeedButton;
  

  HTTPRIOENCurrentTransformer: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENCurrentTransformerTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCurrentTransformerFilterEdit: TfrmENCurrentTransformerFilterEdit;
  ENCurrentTransformerFilterObj: ENCurrentTransformerFilter;

implementation

uses
  ShowENCurrentTransformerType
  ,ENCurrentTransformerTypeController
  ,ShowENElement
  ,ENElementController
  ,ShowENHighVoltageSell
  ,ENHighVoltageSellController
;

{uses  
    EnergyproController, EnergyproController2, ENCurrentTransformerController  ;
}
{$R *.dfm}



procedure TfrmENCurrentTransformerFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtAccruracyClass
      ,edtNumberGen
      ,edtCoefTransformation
      ,edtSecondaryWindingsNumber
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENCurrentTransformerObj.accruracyClass <> nil ) then
       edtAccruracyClass.Text := ENCurrentTransformerObj.accruracyClass.decimalString
    else
       edtAccruracyClass.Text := ''; 



    if ( ENCurrentTransformerObj.numberGen <> nil ) then
       edtNumberGen.Text := ENCurrentTransformerObj.numberGen.decimalString
    else
       edtNumberGen.Text := ''; 



    if ( ENCurrentTransformerObj.coefTransformation <> nil ) then
       edtCoefTransformation.Text := ENCurrentTransformerObj.coefTransformation.decimalString
    else
       edtCoefTransformation.Text := ''; 



    if ( ENCurrentTransformerObj.secondaryWindingsNumber <> nil ) then
       edtSecondaryWindingsNumber.Text := ENCurrentTransformerObj.secondaryWindingsNumber.decimalString
    else
       edtSecondaryWindingsNumber.Text := ''; 


  end;

}

end;



procedure TfrmENCurrentTransformerFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENCurrentTransformerFilterObj.accruracyClass = nil ) then
       ENCurrentTransformerFilterObj.accruracyClass := TXSDecimal.Create;
     if edtAccruracyClass.Text <> '' then
       ENCurrentTransformerFilterObj.accruracyClass.decimalString := edtAccruracyClass.Text 
     else
       ENCurrentTransformerFilterObj.accruracyClass := nil;




     if (ENCurrentTransformerFilterObj.numberGen = nil ) then
       ENCurrentTransformerFilterObj.numberGen := TXSDecimal.Create;
     if edtNumberGen.Text <> '' then
       ENCurrentTransformerFilterObj.numberGen.decimalString := edtNumberGen.Text 
     else
       ENCurrentTransformerFilterObj.numberGen := nil;




     if (ENCurrentTransformerFilterObj.coefTransformation = nil ) then
       ENCurrentTransformerFilterObj.coefTransformation := TXSDecimal.Create;
     if edtCoefTransformation.Text <> '' then
       ENCurrentTransformerFilterObj.coefTransformation.decimalString := edtCoefTransformation.Text 
     else
       ENCurrentTransformerFilterObj.coefTransformation := nil;




     if (ENCurrentTransformerFilterObj.secondaryWindingsNumber = nil ) then
       ENCurrentTransformerFilterObj.secondaryWindingsNumber := TXSDecimal.Create;
     if edtSecondaryWindingsNumber.Text <> '' then
       ENCurrentTransformerFilterObj.secondaryWindingsNumber.decimalString := edtSecondaryWindingsNumber.Text 
     else
       ENCurrentTransformerFilterObj.secondaryWindingsNumber := nil;





  end;
end;

procedure TfrmENCurrentTransformerFilterEdit.spbENCurrentTransformerTypeClick(Sender : TObject);
var 
   frmENCurrentTransformerTypeShow: TfrmENCurrentTransformerTypeShow;
begin
   frmENCurrentTransformerTypeShow:=TfrmENCurrentTransformerTypeShow.Create(Application,fmNormal);
   try
      with frmENCurrentTransformerTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCurrentTransformerFilterObj.currentTransformerType = nil then
                 ENCurrentTransformerFilterObj.currentTransformerType := ENCurrentTransformerType.Create();
               ENCurrentTransformerFilterObj.currentTransformerType.code := StrToInt(GetReturnValue(sgENCurrentTransformerType,0));
               edtENCurrentTransformerTypeName.Text:=GetReturnValue(sgENCurrentTransformerType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENCurrentTransformerTypeShow.Free;
   end;
end;


procedure TfrmENCurrentTransformerFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCurrentTransformerFilterObj.element = nil then ENCurrentTransformerFilterObj.element := ENElement.Create();
               ENCurrentTransformerFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENCurrentTransformerFilterEdit.spbENHighVoltageSellHighvoltageSellClick(Sender : TObject);
var 
   frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
begin
   frmENHighVoltageSellShow:=TfrmENHighVoltageSellShow.Create(Application,fmNormal);
   try
      with frmENHighVoltageSellShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCurrentTransformerFilterObj.highvoltageSell = nil then ENCurrentTransformerFilterObj.highvoltageSell := ENHighVoltageSell.Create();
               ENCurrentTransformerFilterObj.highvoltageSell.code := StrToInt(GetReturnValue(sgENHighVoltageSell,0));
               edtENHighVoltageSellHighvoltageSellName.Text:=GetReturnValue(sgENHighVoltageSell,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENHighVoltageSellShow.Free;
   end;
end;





end.