
unit EditENDistanceFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDistanceController ;

type
  TfrmENDistanceFilterEdit = class(TDialogForm)

    lblDistance : TLabel;
    edtDistance: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENRoadTypeRoadTypeName : TLabel;
  edtENRoadTypeRoadTypeName : TEdit;
  spbENRoadTypeRoadType : TSpeedButton;
  

  HTTPRIOENDistance: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENRoadTypeRoadTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDistanceFilterEdit: TfrmENDistanceFilterEdit;
  ENDistanceFilterObj: ENDistanceFilter;

implementation

uses
  ShowENRoadType
  ,ENRoadTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENDistanceController  ;
}
{$R *.dfm}



procedure TfrmENDistanceFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDistance
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENDistanceObj.distance <> nil ) then
       edtDistance.Text := ENDistanceObj.distance.decimalString
    else
       edtDistance.Text := ''; 



    edtCommentGen.Text := ENDistanceObj.commentGen; 


  end;

}

end;



procedure TfrmENDistanceFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDistance: ENDistanceControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENDistanceFilterObj.distance = nil ) then
       ENDistanceFilterObj.distance := TXSDecimal.Create;
     ENDistanceFilterObj.distance.decimalString := edtDistance.Text ;



     ENDistanceFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;

procedure TfrmENDistanceFilterEdit.spbENRoadTypeRoadTypeClick(Sender : TObject);
var 
   frmENRoadTypeShow: TfrmENRoadTypeShow;
begin
   frmENRoadTypeShow:=TfrmENRoadTypeShow.Create(Application,fmNormal);
   try
      with frmENRoadTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDistanceFilterObj.roadType = nil then ENDistanceFilterObj.roadType := ENRoadType.Create();
               ENDistanceFilterObj.roadType.code := StrToInt(GetReturnValue(sgENRoadType,0));
               edtENRoadTypeRoadTypeName.Text:=GetReturnValue(sgENRoadType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENRoadTypeShow.Free;
   end;
end;





end.