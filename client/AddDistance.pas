unit AddDistance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls ,XSBuiltIns;

type
  TfrmAddDistance = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtDistance: TEdit;
    lblAddDistance: TLabel;
    edtAmountOfJourney: TEdit;
    lblDistance: TLabel;
    lblAmountOfJourneys: TLabel;
  private
    { Private declarations }
  public

    { Public declarations }
  end;

implementation

{$R *.dfm}
 uses  ChildFormUnit , EnergyproController , DMReportsUnit, ENConsts;


end.
