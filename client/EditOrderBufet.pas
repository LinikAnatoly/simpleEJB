unit EditOrderBufet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, InvokeRegistry, Grids, BaseGrid, AdvGrid, Rio,
  SOAPHTTPClient, ComCtrls, ToolWin, ImgList,XSBuiltIns,ENPlanWorkController,
  StdCtrls, AdvObj;

type
  TfrmBufetOrder = class(TDialogForm)
    sgBufetOrder: TAdvStringGrid;
    Button1: TButton;
    HTTPRIOENPlanWork: THTTPRIO;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    numberDoc:String;
    aDate:TXSDate;
  end;

var
  frmBufetOrder: TfrmBufetOrder;

implementation

{$R *.dfm}

procedure TfrmBufetOrder.Button1Click(Sender: TObject);
begin
if sgBufetOrder.RowCount>1 then
begin
numberDoc:=sgBufetOrder.Cells[0,sgBufetOrder.Row];
end;
close;
end;

procedure TfrmBufetOrder.FormShow(Sender: TObject);
var
TempENPlanWork: ENPlanWorkControllerSoapPort;
bufetOrderList:BufetOrderShortList;
LastCount,n,i,LastRow:Integer;
begin
bufetOrderList:=BufetOrderShortList.Create;
numberDoc:='';
TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
try
bufetOrderList:=TempENPlanWork.getBufetOrderMaterialList(aDate);
LastCount:=High(bufetOrderList.list);

  if LastCount > -1 then
     sgBufetOrder.RowCount:=LastCount+2
  else
     sgBufetOrder.RowCount:=2;

   with sgBufetOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        n := 0;

        Cells[n,i+1] := bufetOrderList.list[i].numberDoc;
        inc(n);

        if bufetOrderList.list[i].dateGen = nil then
          Cells[n,i+1] := ''
        else
          // Cells[n,i+1] := XSDate2String(bufetOrderList.list[i].dateGen); NET-4213
          Cells[n,i+1] := XSDateTimeWithDate2String(bufetOrderList.list[i].dateGen);
        inc(n);

        Cells[n,i+1] := bufetOrderList.list[i].sum.DecimalString;
        inc(n);


        LastRow:=i+1;
        sgBufetOrder.RowCount:=LastRow+1;
      end;
  // ColCount:=ColCount+1;
   sgBufetOrder.Row:=1;

finally
bufetOrderList.Free;
end;

end;

end.
