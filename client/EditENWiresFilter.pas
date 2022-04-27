
unit EditENWiresFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWiresController ;

type
  TfrmENWiresFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblCountWires : TLabel;
    edtCountWires: TEdit;

    lblWireLength : TLabel;
    edtWireLength: TEdit;

    lblExternOrg : TLabel;
    edtExternOrg: TMemo;

    lblIsCabel : TLabel;
    edtIsCabel: TEdit;

    lblIsRadio : TLabel;
    edtIsRadio: TEdit;

    lblIsIllumination : TLabel;
    edtIsIllumination: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENWires: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENWiresFilterEdit: TfrmENWiresFilterEdit;
  ENWiresFilterObj: ENWiresFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENWiresController  ;
}
{$R *.dfm}



procedure TfrmENWiresFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtCountWires
      ,edtExternOrg
      ,edtIsCabel
      ,edtIsRadio
      ,edtIsIllumination
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := ENWiresObj.numberGen; 



    if ( ENWiresObj.countWires <> Low(Integer) ) then
       edtCountWires.Text := IntToStr(ENWiresObj.countWires)
    else
       edtCountWires.Text := '';



    if ( ENWiresObj.wireLength <> nil ) then
       edtWireLength.Text := ENWiresObj.wireLength.decimalString
    else
       edtWireLength.Text := ''; 



    MakeMultiline(edtExternOrg.Lines, ENWiresObj.externOrg);



    if ( ENWiresObj.isCabel <> Low(Integer) ) then
       edtIsCabel.Text := IntToStr(ENWiresObj.isCabel)
    else
       edtIsCabel.Text := '';



    if ( ENWiresObj.isRadio <> Low(Integer) ) then
       edtIsRadio.Text := IntToStr(ENWiresObj.isRadio)
    else
       edtIsRadio.Text := '';



    if ( ENWiresObj.isIllumination <> Low(Integer) ) then
       edtIsIllumination.Text := IntToStr(ENWiresObj.isIllumination)
    else
       edtIsIllumination.Text := '';


  end;

}

end;



procedure TfrmENWiresFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENWires: ENWiresControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin

     ENWiresFilterObj.numberGen := edtNumberGen.Text; 



     if ( edtCountWires.Text <> '' ) then
       ENWiresFilterObj.countWires := StrToInt(edtCountWires.Text)
     else
       ENWiresFilterObj.countWires := Low(Integer) ;




     if (ENWiresFilterObj.wireLength = nil ) then
       ENWiresFilterObj.wireLength := TXSDecimal.Create;
     if edtWireLength.Text <> '' then
       ENWiresFilterObj.wireLength.decimalString := edtWireLength.Text 
     else
       ENWiresFilterObj.wireLength := nil;




     ENWiresFilterObj.externOrg := edtExternOrg.Text; 



     if ( edtIsCabel.Text <> '' ) then
       ENWiresFilterObj.isCabel := StrToInt(edtIsCabel.Text)
     else
       ENWiresFilterObj.isCabel := Low(Integer) ;




     if ( edtIsRadio.Text <> '' ) then
       ENWiresFilterObj.isRadio := StrToInt(edtIsRadio.Text)
     else
       ENWiresFilterObj.isRadio := Low(Integer) ;




     if ( edtIsIllumination.Text <> '' ) then
       ENWiresFilterObj.isIllumination := StrToInt(edtIsIllumination.Text)
     else
       ENWiresFilterObj.isIllumination := Low(Integer) ;





  end;
end;

procedure TfrmENWiresFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENWiresFilterObj.element = nil then ENWiresFilterObj.element := ENElement.Create();
               ENWiresFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.